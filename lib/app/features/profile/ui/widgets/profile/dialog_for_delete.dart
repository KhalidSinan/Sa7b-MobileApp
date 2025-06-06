import 'package:flutter/material.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:sa7b/core/helpers/extentions.dart';

import '../../../../../../core/utils/imports_manager.dart';

void dialogForDeleteWidget({
  required BuildContext context,
  required void Function() onPressedDelete,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(AppStrings.sureWantDelete),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              AppStrings.cancel,
              style: TextStyle(
                fontFamily: AppFonts.Cairo,
                fontSize: AppFontSize.s12,
                fontWeight: AppFontWeight.regular,
                color: AppColors.black,
              ),
            ),
          ),
          TextButton(
            onPressed: onPressedDelete,
            child: Text(
              AppStrings.delete,
              style: TextStyle(
                fontFamily: AppFonts.Cairo,
                fontSize: AppFontSize.s12,
                fontWeight: AppFontWeight.regular,
                color: AppColors.error,
              ),
            ),
          ),
        ],
      );
    },
  );
}
