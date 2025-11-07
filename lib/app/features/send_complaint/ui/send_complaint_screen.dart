import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/send_complaint/logic/cubit/send_complaint_cubit.dart';
import 'package:sa7b/core/helpers/extentions.dart';
import 'package:sa7b/core/helpers/spacing.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/core/widgets/custom_elevated_button.dart';
import 'package:sa7b/app/features/send_complaint/ui/widgets/send_complaint_add_media.dart';
import 'package:sa7b/app/features/send_complaint/ui/widgets/send_complaint_description.dart';
import 'package:sa7b/app/features/send_complaint/ui/widgets/send_complaint_title.dart';
import 'package:sa7b/app/features/send_complaint/ui/widgets/send_complaint_type.dart';

import '../../../../core/widgets/loading_widget.dart';
import '../logic/states/send_complaint_state.dart';

class SendComplaintScreen extends StatelessWidget {
  const SendComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'إرسال شكوى',
              style: AppTextStyles.s16_medium.copyWith(
                color: AppColors.primary,
              ),
              textDirection: TextDirection.ltr,
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          iconSize: AppSizes.s18.sp,
          color: AppColors.greyBlue,
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: BlocConsumer<SendComplaintCubit, SendComplaintState>(
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
          final cubit = context.read<SendComplaintCubit>();
          return Form(
            key: cubit.formKey,
            child: Padding(
              padding: EdgeInsets.all(AppSizes.p20.sp),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListView(
                  children: [
                    // Title
                    SendComplaintTitle(),
                    verticalSpace(AppSizes.s20),
                    // Type
                    SendComplaintType(),
                    verticalSpace(AppSizes.s20),
                    // Description
                    SendComplaintDescription(),
                    verticalSpace(AppSizes.s20),
                    // Add Media
                    SendComplaintAddMedia(),
                    // Send Button
                    state.maybeWhen(
                      loading: () => const LoadingWidget(),
                      orElse:
                          () => Align(
                            alignment: Alignment.center,
                            child: CustomElevatedButton(
                              onPressed: () {
                                final formState = cubit.formKey.currentState;
                                final List<File> images = [];
                                if (cubit.image != null) {
                                  images.add(cubit.image!);
                                }
                                if (formState?.validate() ?? false) {
                                  cubit.sendComplaint(images: images);
                                }
                              },
                              text: 'إرسال',
                              width: AppSizes.s250.sp,
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
