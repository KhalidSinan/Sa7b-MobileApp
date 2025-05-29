part of '../utils/imports_manager.dart';

abstract final class AppTheme {
  AppTheme._();

  /// Theme
  static final theme = ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: AppFonts.Cairo,
    brightness: Brightness.light,
    useMaterial3: true,
  );
}
