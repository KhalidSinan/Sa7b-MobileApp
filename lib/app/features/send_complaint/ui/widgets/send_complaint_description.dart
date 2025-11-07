import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/core/widgets/custom_text_field.dart';

import '../../logic/cubit/send_complaint_cubit.dart';

class SendComplaintDescription extends StatelessWidget {
  const SendComplaintDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SendComplaintCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('نص تفصيلي', style: AppTextStyles.s14_medium),
        SizedBox(height: AppSizes.s10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.p4.w),
          child: CustomTextField(
            hintText: 'اكتب ما تريد',
            maxLines: 6,
            controller: cubit.descriptionController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'الرجاء إدخال نص تفصيلي';
              }
              if (value.length < 10) {
                return 'يجب أن يكون النص التفصيلي على الأقل 10 أحرف';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
