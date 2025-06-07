import 'package:flutter/material.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/app/features/profile/ui/widgets/edit_profile/profile_image_widget.dart';

import 'widgets/app_bar_widget.dart';
import 'widgets/edit_profile/students_info_form.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        appBar: appBarWidget(
          title: AppStrings.editProfileInfo,
          context: context,
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [ProfileImageWidget(), StudentInfoForm()],
            ),
          ),
        ),
      ),
    );
  }
}
