import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:sa7b/core/helpers/spacing.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

import 'dialog_for_delete.dart';

void onMoreOptionsPressed({
  required BuildContext context,
  required void Function() onPressedDelete,
  required void Function() onPressedEdit,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0.dm, horizontal: 20.dm),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 134.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.darkGrey,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            verticalSpace(15),
            ListTile(
              leading: Icon(Icons.edit, color: AppColors.primary),
              title: const Text(AppStrings.editInfo, textAlign: TextAlign.left),
              onTap: onPressedEdit,
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text(AppStrings.delete, textAlign: TextAlign.left),
              onTap: () {
                dialogForDeleteWidget(
                  context: context,
                  onPressedDelete: onPressedDelete,
                );
              },
            ),
          ],
        ),
      );
    },
  );
}
