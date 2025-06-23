import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/profile/logic/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:sa7b/core/constants/app_strings.dart';

import '../../../../../../core/utils/imports_manager.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      buildWhen: (previous, current) {
        return current is ImagePicked ||
            (previous is! ImagePicked && current is ImagePicked);
      },
      builder: (context, state) {
        final cubit = context.read<EditProfileCubit>();
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.dm, left: 20.dm, right: 20.dm),
              child: CircleAvatar(
                radius: 50.r,
                backgroundColor: AppColors.black,
                backgroundImage:
                    cubit.imageFile != null
                        ? FileImage(cubit.imageFile!)
                        : null,
                child:
                    cubit.imageFile == null
                        ? Image.asset(AppImages.defaultProfileImage)
                        : null,
              ),
            ),
            TextButton(
              onPressed: () {
                cubit.pickImage();
              },
              child: Text(
                AppStrings.changeProfilePicture,
                style: TextStyle(
                  fontFamily: AppFonts.Cairo,
                  fontSize: AppFontSize.s12,
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
