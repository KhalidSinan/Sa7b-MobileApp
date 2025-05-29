part of '../utils/imports_manager.dart';

abstract final class AppColors {
  AppColors._();

  ///--- Primary & Secondary
  static const primary = Color(0xff65AAEA);
  static const secondary = Color(0xff1F4365);
  static const third = Color(0xffE3562A);

  ///--- Neutral Colors
  static const black = Color(0xff000000);
  static const white = Color(0xffFFFFFF);
  static const grey = Color(0xff909090);
  static const lightGrey = Color(0xffF8FAFC);
  static const darkGrey = Color(0xff605A56);

  static const error = Color(0xffFF0000);
  static const success = Color.fromARGB(255, 0, 179, 0);
  static const yellow = Color(0xffFFDF00);
}
