import 'package:flutter/material.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextEditingController? controller;
  final int? maxLines;
  final int? minLines;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.hintStyle,
    this.textStyle,
    this.controller,
    this.maxLines,
    this.minLines,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.focusNode,
    this.readOnly = false,
    this.onTap,
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
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        minLines: minLines,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        focusNode: focusNode,
        onTap: onTap,
        style: textStyle ?? AppTextStyles.s14_medium,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:
              hintStyle ??
              AppTextStyles.s14_medium.copyWith(color: AppColors.greyBlue),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          contentPadding: EdgeInsets.symmetric(vertical: AppSizes.p10),
        ),
      ),
    );
  }
}
