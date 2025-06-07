import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class SelectedSubjectsWidget extends StatelessWidget {
  final List<String> subjects;
  final void Function(String subject) onDelete;
  const SelectedSubjectsWidget({
    super.key,
    required this.subjects,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children:
          subjects.map((subject) {
            return Chip(
              label: Text(subject),
              backgroundColor: AppColors.lightGrey,
              deleteIcon: Icon(
                Icons.close,
                size: 18.sp,
                color: AppColors.black,
              ),
              onDeleted: () => onDelete(subject),
            );
          }).toList(),
    );
  }
}
