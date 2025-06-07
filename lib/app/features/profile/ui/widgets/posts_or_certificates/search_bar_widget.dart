import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class SearchBarWidget extends StatelessWidget {
  final VoidCallback onFilterTap;

  const SearchBarWidget({super.key, required this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: CustomTextField(hintText: AppStrings.search)),
        horizontalSpace(8),
        IconButton(
          onPressed: onFilterTap,
          icon: Icon(Icons.tune, color: AppColors.secondary, size: 28.sp),
        ),
      ],
    );
  }
}
