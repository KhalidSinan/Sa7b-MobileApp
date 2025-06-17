import 'package:flutter/material.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Widget? image;
  final Widget? icon;
  final Widget? details;

  const CustomCard({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
    this.image,
    this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.lightBlue,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: icon,
        title: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (details != null) details!,
                  Text(
                    title,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            if (image != null) ...[SizedBox(width: AppSizes.p10), image!],
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
