import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/core/widgets/custom_text_field.dart';

import '../../logic/cubit/send_complaint_cubit.dart';

class SendComplaintTitle extends StatelessWidget {
  const SendComplaintTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SendComplaintCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ادخل العنوان', style: AppTextStyles.s14_medium),
        SizedBox(height: AppSizes.s10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.p4.w),
          child: CustomTextField(
            hintText: 'عنوان المشكلة',
            controller: cubit.titleController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال عنوان المشكلة';
              }
              if (value.length < 5) {
                return 'يجب أن يكون العنوان على الأقل 5 أحرف';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
