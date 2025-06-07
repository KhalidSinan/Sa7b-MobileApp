import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

Future<List<String>?> showSubjectsDialog({
  required BuildContext context,
  required List<String> allSubjects,
  required List<String> selectedSubjects,
}) {
  final List<String> tempSelected = List.from(selectedSubjects);

  return showDialog<List<String>>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text(AppStrings.selecetSubject),
            content: SingleChildScrollView(
              child: Wrap(
                spacing: 8.dm,
                runSpacing: 8.dm,
                children:
                    allSubjects.map((subject) {
                      final isSelected = tempSelected.contains(subject);
                      return FilterChip(
                        label: Text(subject),
                        selected: isSelected,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              tempSelected.add(subject);
                            } else {
                              tempSelected.remove(subject);
                            }
                          });
                        },
                        selectedColor: AppColors.primary,
                        checkmarkColor: AppColors.white,
                        // backgroundColor: AppColors.lightGrey,
                      );
                    }).toList(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  AppStrings.cancel,
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, tempSelected),
                child: const Text(
                  AppStrings.done,
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
