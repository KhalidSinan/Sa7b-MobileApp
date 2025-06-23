import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/posts_list_cubit.dart';
import 'package:sa7b/app/features/profile/ui/widgets/app_bar_widget.dart';
import 'package:sa7b/app/features/profile/ui/widgets/posts_or_certificates/search_bar_widget.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:sa7b/core/helpers/extentions.dart';
import 'package:sa7b/core/helpers/spacing.dart';
import 'package:sa7b/core/routing/routes.dart';
import 'package:sa7b/core/widgets/loading_widget.dart';
import '../../../../core/utils/imports_manager.dart';
import '../data/models/posts/edit_post_args.dart';
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
        floatingActionButton: _buildFloatingActionButton(),
        backgroundColor: AppColors.lightGrey,
        appBar: appBarWidget(
          title:
              widget.contentType == AppStrings.posts
                  ? widget.contentType
                  : AppStrings.certificate,
          context: context,
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: () async => context.read<PostsListCubit>().posts(),
      child: SizedBox(
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
              _builBlocConsumer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builBlocConsumer() {
    return BlocConsumer<PostsListCubit, PostsListState>(
      listener: (context, state) {
        state.whenOrNull(
          deleted: (res) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: [
                      const Icon(Icons.check_circle, color: AppColors.white),
                      const SizedBox(width: 8),
                      Text(res.message),
                    ],
                  ),
                  backgroundColor: AppColors.success,
                  duration: const Duration(seconds: 2),
                ),
              );
              context.pop();
              context.pop();
              context.read<PostsListCubit>().posts();
            });
          },
          error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error), backgroundColor: AppColors.error),
            );
          },
        );
      },
      builder:
          (context, state) => state.maybeWhen(
            loading: () => const LoadingWidget(),
            success:
                (posts) => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: posts.data.length,
                  itemBuilder: (context, index) {
                    final cubit = context.read<PostsListCubit>();

                    return PostOrCertificateCard(
                      userName: posts.data[index].studentName.toString(),
                      content: posts.data[index].description.toString(),
                      date:
                          posts.data[index].files.isNotEmpty
                              ? posts.data[index].files.last.createdAt
                              : DateTime.now().toString(),
                      onShowPopupMenu: () {
                        onMoreOptionsPressed(
                          context: context,
                          onPressedDelete: () {
                            cubit.deletePost(posts.data[index].id);
                          },
                          onPressedEdit: () {
                            final files = posts.data[index].files;

                            File? imageFile;
                            File? videoFile;

                            // String buildFullUrl(String path) {
                            //   return path.startsWith('http')
                            //       ? path
                            //       : 'http://10.0.2.2:8000/$path';
                            // }

                            for (final fileObj in files) {
                              final fileUrl = fileObj.file;

                              if (cubit.isImage(fileUrl)) {
                                imageFile = File(fileUrl);
                              } else if (cubit.isVideo(fileUrl)) {
                                videoFile = File(fileUrl);
                              }
                            }

                            context.pushNamed(
                              Routes.editPost,
                              arguments: EditPostArgs(
                                id: posts.data[index].id,
                                title: posts.data[index].title,
                                description: posts.data[index].description,
                                visibility: posts.data[index].visibility,
                                imageFile: imageFile,
                                videoFile: videoFile,
                              ),
                            );
                          },
                        );
                      },
                      isOwner: widget.isOwner,
                      attachmentPath:
                          cubit.getAttachmentInfo(posts, index)['path'],
                      attachmentType:
                          cubit.getAttachmentInfo(posts, index)['type'],
                    );
                  },
                ),
            error:
                (error) => Center(child: Text('Error on Fetch Posts $error')),
            orElse: () => Center(child: Text('No Posts Found')),
          ),
    );
  }

  Widget? _buildFloatingActionButton() {
    return widget.isOwner
        ? FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.dm),
          ),
          onPressed:
              widget.contentType == AppStrings.posts
                  ? () => context.pushNamed(Routes.addPostOrCertificate)
                  : () => context.pushNamed(
                    Routes.addPostOrCertificate,
                    arguments: {'contentType': AppStrings.addCertificate},
                  ),
          backgroundColor: AppColors.primary,
          child: Icon(Icons.add),
        )
        : null;
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
