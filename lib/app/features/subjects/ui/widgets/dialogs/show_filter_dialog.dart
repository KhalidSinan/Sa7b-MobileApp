import 'package:flutter/material.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

void showFilterDialog(BuildContext context) {
  String selectedYear = 'الخامسة';
  String selectedMajor = 'برمجيات';

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.r16),
        ),
        title: Text(
          'الفرز حسب',
          textAlign: TextAlign.right,
          style: TextStyle(fontSize: AppSizes.s16),
        ),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedYear,
                        icon: Icon(Icons.arrow_drop_down),
                        items:
                            [
                                  'الأولى',
                                  'الثانية',
                                  'الثالثة',
                                  'الرابعة',
                                  'الخامسة',
                                ]
                                .map(
                                  (year) => DropdownMenuItem(
                                    alignment: Alignment.centerRight,
                                    value: year,
                                    child: Text(year),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          setState(() => selectedYear = value!);
                        },
                      ),
                    ),
                    SizedBox(width: AppSizes.p16),
                    Text('السنة', textAlign: TextAlign.right),
                  ],
                ),
                SizedBox(height: AppSizes.p12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: selectedMajor,
                        icon: Icon(Icons.arrow_drop_down),
                        items:
                            ['برمجيات', 'ذكاء صنعي', 'شبكات']
                                .map(
                                  (major) => DropdownMenuItem(
                                    alignment: Alignment.centerRight,
                                    value: major,
                                    child: Text(major),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) {
                          setState(() => selectedMajor = value!);
                        },
                      ),
                    ),

                    SizedBox(width: 16),
                    Text('الاختصاص', textAlign: TextAlign.right),
                  ],
                ),
              ],
            );
          },
        ),
        actions: [
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.r12),
                  side: BorderSide(color: AppColors.primary, width: 1.5),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('تطبيق', style: TextStyle(color: AppColors.white)),
            ),
          ),
        ],
      );
    },
  );
}
