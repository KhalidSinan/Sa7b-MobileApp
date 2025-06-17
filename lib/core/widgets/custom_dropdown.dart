import 'package:flutter/material.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String? value;
  final String hintText;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.hintText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.p20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.r10),
        boxShadow: [
          BoxShadow(color: AppColors.greyBlue, blurRadius: AppSizes.r10),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: const InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          filled: true,
          fillColor: AppColors.white,
        ),
        icon: Icon(Icons.arrow_drop_down_outlined, color: AppColors.greyBlue),
        hint: Text(
          hintText,
          style: AppTextStyles.s14_medium.copyWith(color: AppColors.greyBlue),
        ),
        items:
            items
                .map(
                  (type) => DropdownMenuItem(
                    value: type,
                    child: Text(type, style: TextStyle(color: AppColors.grey)),
                  ),
                )
                .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
