import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

Widget buildQuestionCard({
  required String question,
  required TextEditingController controller,
  required bool isRequired,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: AppSizes.p16),
    padding: EdgeInsets.all(AppSizes.p16),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(AppSizes.r16),
      boxShadow: [
        BoxShadow(
          color: AppColors.greyBlue.withOpacity(0.1),
          blurRadius: 6,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RichText(
          text: TextSpan(
            text: question,
            style: AppTextStyles.s14_medium.copyWith(color: Colors.black),
            children: isRequired
                ? [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              )
            ]
                : [],
          ),
          textDirection: TextDirection.rtl,
        ),
        SizedBox(height: AppSizes.s8.h),
        TextField(
          controller: controller,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "اجابتك",
            border: OutlineInputBorder(),
          ),
          textDirection: TextDirection.rtl,
        ),
      ],
    ),
  );
}
