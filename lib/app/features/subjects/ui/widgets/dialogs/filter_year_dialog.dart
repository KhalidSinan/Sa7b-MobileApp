import 'package:flutter/material.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class FilterYearDialog {
  static void show(BuildContext context) {
    String? selectedYear;
    final List<String> years = [
      '2020-2021',
      '2021-2022',
      '2022-2023',
      '2023-2024',
      '2024-2025',
    ];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r16)),
          title: Text(
            'الفلتر حسب',
            style: TextStyle(fontSize: AppSizes.s14),
            textAlign: TextAlign.end,
          ),
          content: StatefulBuilder(
            builder: (context, setState) {
              return DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'السنة الدراسية',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSizes.r10),
                  ),
                ),
                value: selectedYear,
                items: years
                    .map((year) => DropdownMenuItem(
                          value: year,
                          child: Text(year),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedYear = value;
                  });
                },
              );
            },
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
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
                child: const Text('تطبيق'),
              ),
            ),
          ],
        );
      },
    );
  }
}
