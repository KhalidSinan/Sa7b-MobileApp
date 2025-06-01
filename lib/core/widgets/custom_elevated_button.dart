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
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 40.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          elevation: MaterialStateProperty.all<double>(4),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: borderColor, width: borderWidth),
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(overlayColor),
        ),
        child: Text(
          text,
          style: textStyle ?? AppTextStyles.s16_bold.copyWith(color: textColor),
        ),
      ),
    );
  }
}
