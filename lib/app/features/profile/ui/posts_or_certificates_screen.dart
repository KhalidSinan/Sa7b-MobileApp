import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/profile/ui/widgets/app_bar_widget.dart';
import 'package:sa7b/app/features/profile/ui/widgets/posts_or_certificates/search_bar_widget.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:sa7b/core/helpers/extentions.dart';
import 'package:sa7b/core/helpers/spacing.dart';
import 'package:sa7b/core/routing/routes.dart';
import '../../../../core/utils/imports_manager.dart';
import 'widgets/posts_or_certificates/selected_subjects_widget.dart';
import 'widgets/posts_or_certificates/subjects_dialog.dart';
import 'widgets/profile/option_for_edit_or_delete_post.dart';
import 'widgets/profile/post_or_certificate_card.dart';

class PostsOrCertificatesScreen extends StatefulWidget {
  final String contentType;
  final bool isOwner;

  const PostsOrCertificatesScreen({
    super.key,
    required this.contentType,
    required this.isOwner,
  });

  @override
  State<PostsOrCertificatesScreen> createState() =>
      _PostsOrCertificatesScreenState();
}

class _PostsOrCertificatesScreenState extends State<PostsOrCertificatesScreen> {
  final List<String> allSubjects = [
    'التحليل',
    'برمجة 2',
    'خوارزميات البحث',
    'الموزعة',
    'هندسة 1',
    'ادارة',
    'رياضيات',
    'عربي',
    'تركي',
  ];

  List<String> selectedSubjects = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton:
            widget.isOwner
                ? FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.dm),
                  ),
                  onPressed:
                      widget.contentType == AppStrings.posts
                          ? () => context.pushNamed(Routes.addPostOrCertificate)
                          : () => context.pushNamed(
                            Routes.addPostOrCertificate,
                            arguments: {
                              'contentType': AppStrings.addCertificate,
                            },
                          ),
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.add),
                )
                : null,
        backgroundColor: AppColors.lightGrey,
        appBar: appBarWidget(
          title:
              widget.contentType == AppStrings.posts
                  ? widget.contentType
                  : AppStrings.certificate,
          context: context,
        ),
        body: SizedBox(
          height: double.infinity.h,
          width: double.infinity.w,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 5.dm, vertical: 12.dm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchBarWidget(onFilterTap: _showSubjectsDialog),
                verticalSpace(10),
                if (selectedSubjects.isNotEmpty)
                  SelectedSubjectsWidget(
                    subjects: selectedSubjects,
                    onDelete: (subject) {
                      setState(() {
                        selectedSubjects.remove(subject);
                      });
                    },
                  ),
                verticalSpace(15),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  itemBuilder:
                      (context, index) => PostOrCertificateCard(
                        userName: 'George Al Nasser',
                        content: 'kajhkjhsadasda',
                        date: '6/6/2025',
                        onShowPopupMenu: () {
                          onMoreOptionsPressed(
                            context: context,
                            onPressedDelete: () {},
                            onPressedEdit: () {},
                          );
                        },
                        isOwner: widget.isOwner,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showSubjectsDialog() async {
    final result = await showSubjectsDialog(
      context: context,
      allSubjects: allSubjects,
      selectedSubjects: selectedSubjects,
    );

    if (result != null) {
      setState(() {
        selectedSubjects = result;
      });
    }
  }
}
