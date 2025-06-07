import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/profile/ui/widgets/profile/image_and_follows_widget.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/imports_manager.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/profile/certificates.dart';
import 'widgets/profile/info_card.dart';
import 'widgets/profile/posts.dart';

class ProfileScreen extends StatelessWidget {
  final bool isOwner;
  const ProfileScreen({super.key, required this.isOwner});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        appBar: appBarWidget(title: AppStrings.profile, context: context),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(10),
                ImageAndFollowsWidget(isOwner: isOwner),
                experiences(),
                InfoCard(isOwner: isOwner),
                SizedBox(height: 270.h, child: Posts(isOwner: isOwner)),
                SizedBox(height: 270.h, child: Certificates(isOwner: isOwner)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget experiences() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.dm, vertical: 10.dm),
      child: Text(
        AppStrings.experiences,
        style: TextStyle(
          fontFamily: AppFonts.Cairo,
          fontSize: AppFontSize.s12,
          fontWeight: AppFontWeight.medium,
          color: AppColors.darkGrey,
        ),
      ),
    );
  }
}
