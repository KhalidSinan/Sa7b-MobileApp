import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:sa7b/core/helpers/extentions.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/imports_manager.dart';
import '../../../logic/cubit/posts/edit_post_cubit.dart';
import 'add_media_buttons_widget.dart';
import 'description_input_widget.dart';
import 'media_preview_widget.dart';
import 'publish_button_widget.dart';
import 'subject_dropdown_widget.dart';
import 'visibility_dropdown_widget.dart';

class EditPostBody extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final String visibility;
  final File? imageFile;
  final File? videoFile;
  const EditPostBody({
    super.key,
    required this.id,
    required this.title,
    required this.description,
    required this.visibility,
    this.imageFile,
    this.videoFile,
  });

  @override
  State<EditPostBody> createState() => _EditPostBodyState();
}

class _EditPostBodyState extends State<EditPostBody> {
  @override
  void initState() {
    super.initState();

    final cubit = context.read<EditPostCubit>();

    cubit.initializePostData(
      title: widget.title,
      description: widget.description,
      visibility: widget.visibility,
      // imageFile: widget.imageFile,
      // videoFile: widget.videoFile,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditPostCubit, EditPostState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (response) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(response.message.toString()),
                backgroundColor: AppColors.success,
                duration: const Duration(seconds: 3),
              ),
            );
            context.pop();
            context.pop();
          },
          error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.toString()),
                backgroundColor: AppColors.error,
                duration: const Duration(seconds: 10),
              ),
            );
            context.pop();
            context.pop();
          },
        );
      },
      builder: (context, state) {
        final cubit = context.read<EditPostCubit>();

        return Form(
          key: cubit.formKey,
          child: Padding(
            padding: EdgeInsets.all(16.dm),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SubjectDropdownWidget(screenType: AppStrings.editPost),
                verticalSpace(25),
                const VisibilityDropdownWidget(screenType: AppStrings.editPost),
                verticalSpace(25),
                const DescriptionInputWidget(screenType: AppStrings.editPost),
                verticalSpace(10),
                const AddMediaButtonsWidget(screenType: AppStrings.editPost),
                const MediaPreviewWidget(screenType: AppStrings.editPost),
                verticalSpace(15),
                PublishButtonWidget(
                  state: state,
                  screenType: AppStrings.editPost,
                  id: widget.id,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
