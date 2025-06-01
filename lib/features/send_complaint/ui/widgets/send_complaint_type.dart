import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/features/send_complaint/data/type.dart';

import '../../../../core/widgets/custom_dropdown.dart';

class SendComplaintType extends StatelessWidget {
  const SendComplaintType({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectType;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'اختر نوع المشكلة',
          style: AppTextStyles.s14_medium,
        ),
        SizedBox(height: AppSizes.s10.h,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.p4.w,),
          child: CustomDropdown(
            items: complainType,
            hintText: 'النوع',
            value: selectType,
            onChanged: (value){
              selectType = value;
            },
          ),
        ),
      ],
    );
  }
}
