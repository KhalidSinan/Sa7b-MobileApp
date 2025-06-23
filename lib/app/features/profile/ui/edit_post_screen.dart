import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/imports_manager.dart';
import '../data/models/posts/edit_post_args.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/posts_or_certificates/edit_post_body.dart';

class EditPostScreen extends StatelessWidget {
  final EditPostArgs args;

  const EditPostScreen({super.key, required this.args});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: appBarWidget(title: AppStrings.editPost, context: context),
        body: SizedBox(
          height: double.infinity.h,
          width: double.infinity.w,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 5.dm, vertical: 12.dm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                EditPostBody(
                  id: args.id,
                  title: args.title,
                  description: args.description,
                  visibility: args.visibility,
                  // imageFile: args.imageFile,
                  // videoFile: args.videoFile,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
