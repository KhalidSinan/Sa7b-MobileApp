import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/imports_manager.dart';

class PostOrCertificateCard extends StatelessWidget {
  final String userName;
  final String date;
  final String content;
  final void Function()? onShowPopupMenu;
  final bool isOwner;

  const PostOrCertificateCard({
    super.key,
    required this.userName,
    required this.date,
    required this.content,
    required this.onShowPopupMenu,
    required this.isOwner,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.dm),
      child: Padding(
        padding: EdgeInsets.all(12.0.dm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(AppImages.defaultProfileImage),
                ),
                horizontalSpace(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontFamily: AppFonts.Cairo,
                        fontWeight: AppFontWeight.bold,
                        fontSize: AppFontSize.s12.dm,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontFamily: AppFonts.Cairo,
                        fontWeight: AppFontWeight.regular,
                        fontSize: AppFontSize.s10.dm,
                        fontStyle: FontStyle.italic,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
                Spacer(flex: 1),
                if(isOwner)
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: onShowPopupMenu,
                    icon: Icon(Icons.more_horiz, color: AppColors.secondary),
                  ),
                ),
              ],
            ),
            verticalSpace(15),
            Text(
              content,
              style: TextStyle(
                fontFamily: AppFonts.Cairo,
                fontSize: AppFontSize.s12.dm,
              ),
            ),
            verticalSpace(15),
            Center(
              child: Container(
                decoration: BoxDecoration(color: AppColors.greyBlue),
                height: 248.h,
                width: 283.w,
                child: Image(image: AssetImage(AppImages.cardImage)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
