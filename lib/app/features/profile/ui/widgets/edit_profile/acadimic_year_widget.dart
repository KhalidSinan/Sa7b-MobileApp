import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/constants/app_strings.dart';

import '../../../../../../core/widgets/custom_dropdown.dart';

// ignore: must_be_immutable
class AcadimicYearWidget extends StatefulWidget {
  const AcadimicYearWidget({super.key});

  @override
  State<AcadimicYearWidget> createState() => _AcadimicYearWidgetState();
}

class _AcadimicYearWidgetState extends State<AcadimicYearWidget> {
  String? selectedValue;

  final List<String> acadimicYearOptions = [
    AppStrings.firstYear,
    AppStrings.secondYear,
    AppStrings.thirdYear,
    AppStrings.fourthYear,
    AppStrings.fifthYear,
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(AppStrings.acadimicYear),
        SizedBox(width: 13.w),
        SizedBox(
          width: 205.w,
          height: 53.h,
          child: CustomDropdown(
            items: acadimicYearOptions,
            value: selectedValue,
            hintText: AppStrings.acadimicYear,
            onChanged: (val) {
              setState(() {
                selectedValue = val;
              });
            },
          ),
        ),
      ],
    );
  }
}
