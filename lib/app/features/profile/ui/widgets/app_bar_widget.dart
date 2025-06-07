import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/helpers/extentions.dart';
import 'package:sa7b/core/helpers/spacing.dart';

import '../../../../../core/utils/imports_manager.dart';

PreferredSize appBarWidget({
  required String title,
  required BuildContext context,
}) {
  final canPop = ModalRoute.of(context)?.canPop ?? false;
  return PreferredSize(
    preferredSize: Size.fromHeight(56.h),
    child: Container(
      padding: EdgeInsets.all(10.dm),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.greyBlue, width: 1.w),
          bottom: BorderSide(color: AppColors.greyBlue, width: 1.w),
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (canPop)
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.greyBlue,
                size: 17.dm,
              ),
            ),
          if (!canPop) horizontalSpace(15),
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
