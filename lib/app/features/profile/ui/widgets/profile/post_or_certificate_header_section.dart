import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/constants/app_strings.dart';

import '../../../../../../core/utils/imports_manager.dart';

class PostOrCertificateHeaderSection extends StatelessWidget {
  final String title;
  final void Function()? onPressedShowMore;
  const PostOrCertificateHeaderSection({
    super.key,
    required this.title,
    required this.onPressedShowMore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.dm, vertical: 1.dm),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: AppFonts.Cairo,
              fontSize: AppFontSize.s16.dm,
              color: AppColors.primary,
              fontWeight: AppFontWeight.medium,
            ),
          ),
          const Spacer(flex: 1),
          TextButton(
            onPressed: onPressedShowMore,
            child: Text(
              AppStrings.showMore,
              style: TextStyle(
                fontFamily: AppFonts.Cairo,
                fontSize: AppFontSize.s12.dm,
                color: AppColors.slateGray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
