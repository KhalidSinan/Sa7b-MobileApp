import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/utils/imports_manager.dart';

class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({super.key});

  @override
  State<ProfileImageWidget> createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> {
  File? imageFile;

  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.dm, left: 20.dm, right: 20.dm),
          child: CircleAvatar(
            radius: 50.r,
            backgroundColor: AppColors.black,
            backgroundImage: imageFile != null ? FileImage(imageFile!) : null,
            child:
                imageFile == null
                    ? Image.asset(AppImages.defaultProfileImage)
                    : null,
          ),
        ),
        TextButton(
          onPressed: pickImage,
          child: Text(
            "Change Profile Picture",
            style: TextStyle(
              fontFamily: AppFonts.Cairo,
              fontSize: AppFontSize.s12,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
