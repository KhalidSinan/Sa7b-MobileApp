import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/constants/app_strings.dart';

import '../../../../../../core/utils/imports_manager.dart';
import '../../../../../../core/widgets/custom_elevated_button.dart';

class ExperienceWidget extends StatefulWidget {
  final void Function(List<String>) onExperiencesChanged;

  const ExperienceWidget({super.key, required this.onExperiencesChanged});

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
  final List<String> experienceOptions = [
    'flutter',
    'laravel',
    'react js',
    'node js',
    'express',
    'c++',
    'java',
    'DevOps',
    'ui ux',
    'Kotlin',
    'c#',
    'Mobile FullStack',
  ];
  final List<String> selectedExperiences = [];

  void _showExperienceDialog() {
    String? selectedValue;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(AppStrings.experience),
          content: StatefulBuilder(
            builder:
                (context, setState) => DropdownButtonFormField<String>(
                  value: selectedValue,
                  hint: const Text(AppStrings.selectYourExperience),
                  items:
                      experienceOptions
                          .map(
                            (type) => DropdownMenuItem(
                              value: type,
                              child: Text(type),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedValue = val;
                    });
                  },
                ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                AppStrings.cancel,
                style: TextStyle(
                  color: AppColors.grey,
                  fontFamily: AppFonts.Cairo,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (selectedValue != null &&
                    !selectedExperiences.contains(selectedValue)) {
                  setState(() {
                    selectedExperiences.add(selectedValue!);
                    widget.onExperiencesChanged(selectedExperiences);
                  });
                }
                Navigator.pop(context);
              },
              child: const Text(
                AppStrings.add,
                style: TextStyle(
                  color: AppColors.grey,
                  fontFamily: AppFonts.Cairo,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.dm),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(AppStrings.experience),
              SizedBox(width: 13.w),
              CustomElevatedButton(
                width: 185.w,
                height: 53.h,
                onPressed: _showExperienceDialog,
                text: AppStrings.addExperience,
                textStyle: TextStyle(color: AppColors.grey),
                backgroundColor: AppColors.white,
                overlayColor: AppColors.greyBlue,
              ),
            ],
          ),
        ),

        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children:
              selectedExperiences
                  .map(
                    (exp) => Chip(
                      label: Text(exp),
                      onDeleted: () {
                        setState(() {
                          selectedExperiences.remove(exp);
                          widget.onExperiencesChanged(selectedExperiences);
                        });
                      },
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}
