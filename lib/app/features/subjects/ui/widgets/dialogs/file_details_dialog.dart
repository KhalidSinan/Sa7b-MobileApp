import 'package:flutter/material.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class FileDetailsDialog {
  static void show({
    required BuildContext context,
    required String type,
    required String size,
  }) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.r16),
            ),
            contentPadding: const EdgeInsets.all(AppSizes.p20),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'تفاصيل الملف',
                  style: TextStyle(fontSize: AppSizes.s14),
                  textAlign: TextAlign.right,
                ),

                Divider(color: AppColors.lightBlue),
                _infoRow('النوع', type),
                const SizedBox(height: AppSizes.p12),
                _infoRow('الحجم', size),
              ],
            ),
          ),
    );
  }

  static Widget _infoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppColors.grey)),
        Text(value),
      ],
    );
  }
}
