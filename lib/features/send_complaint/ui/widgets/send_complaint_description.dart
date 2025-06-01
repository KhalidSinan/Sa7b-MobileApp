import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/core/widgets/custom_text_field.dart';

class SendComplaintDescription extends StatelessWidget {
  const SendComplaintDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'نص تفصيلي',
          style: AppTextStyles.s14_medium,
        ),
        SizedBox(height: AppSizes.s10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.p4.w,),
          child: CustomTextField(
            hintText: 'اكتب ما تريد',
            maxLines: 6,
          ),
        ),
      ],
    );
  }
}
