import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/profile/ui/widgets/app_bar_widget.dart';
import 'package:sa7b/app/features/profile/ui/widgets/posts_or_certificates/add_post_or_certificate_body.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class AddPostOrCertificateScreen extends StatelessWidget {
  final String contentType;
  const AddPostOrCertificateScreen({super.key, required this.contentType});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: appBarWidget(
          title:
              contentType == AppStrings.addPost
                  ? contentType
                  : AppStrings.addCertificate,
          context: context,
        ),
        body: SizedBox(
          height: double.infinity.h,
          width: double.infinity.w,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 5.dm, vertical: 12.dm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [AddPostOrCertificateBody()],
            ),
          ),
        ),
      ),
    );
  }
}
