import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/academic_guidens/my_gudidance/data/sources/my_gudidance_service.dart';
import 'package:sa7b/app/features/academic_guidens/my_gudidance/logic/cubits/my_gudidance_cubit.dart';
import 'package:sa7b/app/features/academic_guidens/my_gudidance/logic/states/my_gudidance_state.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/sources/subject_guidens_service.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/logic/cubits/subject_guidens_cubit.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/logic/states/subject_guidens_state.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/ui/widgets/add_guidance.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/ui/widgets/my_menu.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/ui/widgets/tab_view.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class CourseGuidanceScreen extends StatefulWidget {
  final int courseId;
  final String courseName;
  final int initialTabIndex;

  const CourseGuidanceScreen({
    super.key,
    required this.courseId,
    required this.courseName,
    this.initialTabIndex = 0, // الافتراضي النظري
  });

  @override
  State<CourseGuidanceScreen> createState() => _CourseGuidanceScreenState();
}

class _CourseGuidanceScreenState extends State<CourseGuidanceScreen> {
  late CourseGuidanceCubit allPostsCubit;
  late MyPostsCubit myPostsCubit;
  bool showMyPosts = false;
  bool showDatePosts = false;

  // ✅ خريطة لحفظ votes لكل منشور
  final Map<int, int> localVotes = {};

  @override
  void initState() {
    super.initState();
    allPostsCubit = CourseGuidanceCubit(AcademicGuidanceRemoteDatasourceImpl());
    myPostsCubit = MyPostsCubit(MyPostsRemoteDatasourceImpl());
    allPostsCubit.fetchCourseGuidance(widget.courseId);
  }

  void fetchAllPosts() {
    if (!mounted) return;
    setState(() {
      showMyPosts = false;
      showDatePosts = false;
    });
    allPostsCubit.fetchCourseGuidance(widget.courseId);
  }

  void fetchMyPosts() {
    if (!mounted) return;
    setState(() {
      showMyPosts = true;
      showDatePosts = false;
    });
    myPostsCubit.fetchMyPosts();
  }

  void updateLocalVote(int postId, int newCount) {
    localVotes[postId] = newCount;
  }

  int getVoteCount(int postId, int originalCount) {
    return localVotes[postId] ?? originalCount;
  }

  Future<void> _pickDateRangeAndFetch() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDateRange: DateTimeRange(
        start: DateTime.now().subtract(const Duration(days: 7)),
        end: DateTime.now(),
      ),
      locale: const Locale('ar', 'SY'),
    );

    if (picked != null && mounted) {
      setState(() {
        showDatePosts = true;
        showMyPosts = false;
      });
      allPostsCubit.filterByDate(picked.start, picked.end);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.initialTabIndex,
      length: 3,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: const Color(0xFFEFEFF4),
          appBar: AppBar(
            title: Text(
              'موادي',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: AppColors.primary,
              ),
            ),
            actions: [
              MyMenuButton(
                fetchAllPosts: fetchAllPosts,
                fetchMyPosts: fetchMyPosts,
                pickDateRange: _pickDateRangeAndFetch,
              ),
            ],
            bottom: const TabBar(
              tabs: [
                Tab(text: "القسم النظري"),
                Tab(text: "القسم العملي"),
                Tab(text: "الفائدة العملية"),
              ],
            ),
          ),
          body: Column(
            children: [
              // ✅ النص اللي فيه "الإرشاد الأكاديمي"
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'الإرشاد الأكاديمي ‹ ${widget.courseName}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),

              // ✅ القسم الرئيسي للتاب
              Expanded(
                child: showMyPosts
                    ? BlocBuilder<MyPostsCubit, MyPostsState>(
                        bloc: myPostsCubit,
                        builder: (context, state) {
                          if (state is MyPostsLoading) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (state is MyPostsLoaded) {
                            return PostsTabView(
                              posts: state.posts,
                              isMyPosts: true,
                              localVotes: localVotes,
                              onVoteUpdated: (id) => (newCount) {
                                updateLocalVote(id, newCount);
                                setState(() {});
                              },
                              onUpdated: () {
                                if (!mounted) return;
                                fetchMyPosts();
                              },
                            );
                          } else if (state is MyPostsError) {
                            return Center(child: Text(state.message));
                          }
                          return const SizedBox();
                        },
                      )
                    : BlocBuilder<CourseGuidanceCubit, CourseGuidanceState>(
                        bloc: allPostsCubit,
                        builder: (context, state) {
                          if (state is CourseGuidanceLoading) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (state is CourseGuidanceLoaded) {
                            return PostsTabView(
                              posts: state.posts,
                              isMyPosts: false,
                              localVotes: localVotes,
                              onVoteUpdated: (id) => (newCount) {
                                updateLocalVote(id, newCount);
                                setState(() {});
                              },
                              onUpdated: fetchAllPosts,
                            );
                          } else if (state is CourseGuidanceError) {
                            return Center(child: Text(state.message));
                          }
                          return const SizedBox();
                        },
                      ),
              ),
            ],
          ),
          floatingActionButton: FabAddGuidance(
            showMyPosts: showMyPosts,
            fetchAllPosts: fetchAllPosts,
            fetchMyPosts: fetchMyPosts,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        ),
      ),
    );
  }
}
