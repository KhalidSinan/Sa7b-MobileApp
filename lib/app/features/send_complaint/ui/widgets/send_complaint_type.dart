import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

import '../../../../../core/widgets/custom_dropdown.dart';
import '../../logic/cubit/send_complaint_cubit.dart';

class SendComplaintType extends StatelessWidget {
  const SendComplaintType({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SendComplaintCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('اختر نوع المشكلة', style: AppTextStyles.s14_medium),
        SizedBox(height: AppSizes.s10.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.p4.w),
          child: CustomDropdown(
            items: cubit.complainType.map((e) => e.name).toList(),
            hintText: 'النوع',
            value:
                cubit.complainType
                    .firstWhere((e) => e.id == cubit.selectedTypeId)
                    .name,
            onChanged: (value) {
              final selected = cubit.complainType.firstWhere(
                (e) => e.name == value,
              );
              cubit.selectedTypeId = selected.id;
            },
            validator: (value) {
              if (value == null) {
                return 'الرجاء اختيار نوع الشكوى';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
