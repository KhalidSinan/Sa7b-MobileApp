import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/constants/app_strings.dart';

import '../../../../../../core/widgets/custom_dropdown.dart';

class AcadimicYearWidget extends StatefulWidget {
  final void Function(String) onYearSelected;

  const AcadimicYearWidget({super.key, required this.onYearSelected});

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
                widget.onYearSelected(_convertYearToNumber(val!));
              });
            },
          ),
        ),
      ],
    );
  }

  String _convertYearToNumber(String yearText) {
    switch (yearText) {
      case AppStrings.firstYear:
        return '1';
      case AppStrings.secondYear:
        return '2';
      case AppStrings.thirdYear:
        return '3';
      case AppStrings.fourthYear:
        return '4';
      case AppStrings.fifthYear:
        return '5';
      default:
        return '1';
    }
  }
}
