import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/profile/ui/widgets/posts_or_certificates/publish_button_widget.dart';
import 'package:sa7b/core/helpers/extentions.dart';
import 'package:sa7b/core/helpers/spacing.dart';

import 'package:sa7b/core/utils/imports_manager.dart';

import '../../../../../../core/constants/app_strings.dart';
import '../../../logic/cubit/posts/add_new_post_cubit.dart';
import 'add_media_buttons_widget.dart';
import 'description_input_widget.dart';
import 'media_preview_widget.dart';
import 'subject_dropdown_widget.dart';
import 'visibility_dropdown_widget.dart';

class AddPostOrCertificateBody extends StatelessWidget {
  const AddPostOrCertificateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewPostCubit, AddNewPostState>(
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
          },
          error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.toString()),
                backgroundColor: AppColors.error,
                duration: const Duration(seconds: 3),
              ),
            );
          },
        );
      },
      builder: (context, state) {
        final cubit = context.read<AddNewPostCubit>();

        return Form(
          key: cubit.formKey,
          child: Padding(
            padding: EdgeInsets.all(16.dm),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SubjectDropdownWidget(screenType: AppStrings.addPost),
                verticalSpace(25),
                const VisibilityDropdownWidget(screenType: AppStrings.addPost),
                verticalSpace(25),
                const DescriptionInputWidget(screenType: AppStrings.addPost),
                verticalSpace(10),
                const AddMediaButtonsWidget(screenType: AppStrings.addPost),
                const MediaPreviewWidget(screenType: AppStrings.addPost),
                verticalSpace(15),
                PublishButtonWidget(
                  state: state,
                  screenType: AppStrings.addPost,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
