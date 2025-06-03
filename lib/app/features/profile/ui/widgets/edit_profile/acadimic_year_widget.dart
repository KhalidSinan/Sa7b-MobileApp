import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    'First Year',
    'Second Year',
    'Third Year',
    'Fourth Year',
    'Fifth Year',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Acadimic Year"),
        SizedBox(width: 13.w),
        SizedBox(
          width: 205.w,
          height: 53.h,
          child: CustomDropdown(
            items: acadimicYearOptions,
            value: selectedValue,
            hintText: 'Acadimic Year',
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
