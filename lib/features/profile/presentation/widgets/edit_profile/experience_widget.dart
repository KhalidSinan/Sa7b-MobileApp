import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/imports_manager.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';

class ExperienceWidget extends StatefulWidget {
  const ExperienceWidget({super.key});

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> {
  final List<String> experienceOptions = [
    'خبرة في تطوير البرمجيات',
    'خبرة في التصميم',
    'خبرة في الاختبار',
  ];
  final List<String> selectedExperiences = [];

  void _showExperienceDialog() {
    String? selectedValue;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Experiences"),
          content: StatefulBuilder(
            builder:
                (context, setState) => DropdownButtonFormField<String>(
                  value: selectedValue,
                  hint: const Text("Select Your Experience"),
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
                "Cancel",
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
                  });
                }
                Navigator.pop(context);
              },
              child: const Text(
                "Add",
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
              const Text("Experience"),
              SizedBox(width: 13.w),
              CustomElevatedButton(
                width: 185.w,
                height: 53.h,
                onPressed: _showExperienceDialog,
                text: 'Add Experience',
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
