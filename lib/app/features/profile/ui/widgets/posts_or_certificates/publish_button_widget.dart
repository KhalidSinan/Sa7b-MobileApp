import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/edit_post_cubit.dart';

import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/utils/imports_manager.dart';
import '../../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../../core/widgets/loading_widget.dart';
import '../../../logic/cubit/posts/add_new_post_cubit.dart';

class PublishButtonWidget extends StatelessWidget {
  final dynamic state;
  final String screenType;
  final int? id;
  const PublishButtonWidget({
    super.key,
    required this.state,
    required this.screenType,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    final addPostCubit = context.read<AddNewPostCubit>();
    final editPostCubit = context.read<EditPostCubit>();

    final bool isAdd = screenType == AppStrings.addPost;

    return SizedBox(
      height: 50.h,
      width: 100.w,
      child: state.maybeWhen(
        loading: () => const LoadingWidget(),
        orElse:
            () => CustomElevatedButton(
              onPressed: () {
                final formState =
                    isAdd
                        ? addPostCubit.formKey.currentState
                        : editPostCubit.formKey.currentState;
                final List<File> files = [];
                if (isAdd
                    ? addPostCubit.image != null
                    : editPostCubit.image != null) {
                  files.add(isAdd ? addPostCubit.image! : editPostCubit.image!);
                }
                if (isAdd
                    ? addPostCubit.videoController != null
                    : editPostCubit.videoController != null) {
                  files.add(
                    File(
                      isAdd
                          ? addPostCubit.videoController!.dataSource
                          : editPostCubit.videoController!.dataSource,
                    ),
                  );
                }
                if (isAdd
                    ? addPostCubit.pdfFile != null
                    : editPostCubit.pdfFile != null) {
                  files.add(
                    isAdd ? addPostCubit.pdfFile! : editPostCubit.pdfFile!,
                  );
                }

                if (formState?.validate() ?? false) {
                  if (files.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'الرجاء إضافة صورة أو فيديو او ملف قبل النشر',
                        ),
                        backgroundColor: AppColors.error,
                        duration: const Duration(seconds: 3),
                      ),
                    );
                    return;
                  }
                  isAdd
                      ? addPostCubit.addNewPost(
                        visibility: addPostCubit.selectedVisibility.toString(),
                        files: files,
                        title: addPostCubit.selectedSubject.toString(),
                      )
                      : editPostCubit.editPost(
                        visibility: editPostCubit.selectedVisibility.toString(),
                        files: files,
                        title: editPostCubit.selectedSubject.toString(),
                        id: id!,
                      );
                }
              },
              text: AppStrings.publishing,
            ),
      ),
    );
  }
}
