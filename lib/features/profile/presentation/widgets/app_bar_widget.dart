import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/imports_manager.dart';

PreferredSize appBarWidget({required String title}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(56.h),
    child: Container(
      padding: EdgeInsets.all(10.dm),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.greyBlue, width: 1),
          bottom: BorderSide(color: AppColors.greyBlue, width: 1),
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(
          //     Icons.arrow_back_ios_new,
          //     color: AppColors.greyBlue,
          //     size: 17.dm,
          //   ),
          // ),
          Text(
            title,
            style: TextStyle(
              fontFamily: AppFonts.Cairo,
              fontWeight: AppFontWeight.medium,
              fontSize: AppFontSize.s16,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    ),
  );
}
