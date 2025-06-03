import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color overlayColor;
  final String text;
  final Color textColor;
  final Color borderColor;
  final double borderWidth;
  final double? width;
  final TextStyle? textStyle;
  final double? height;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.overlayColor = AppColors.secondary,
    required this.text,
    this.textColor = AppColors.white,
    this.borderColor = Colors.transparent,
    this.borderWidth = 2,
    this.width,
    this.textStyle,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
      height: height?.h ?? 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
          elevation: WidgetStateProperty.all<double>(4),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
              side: BorderSide(color: borderColor, width: borderWidth),
            ),
          ),
          overlayColor: WidgetStateProperty.all<Color>(overlayColor),
        ),
        child: Text(
          text,
          style: textStyle ?? AppTextStyles.s16_bold.copyWith(color: textColor),
        ),
      ),
    );
  }
}
