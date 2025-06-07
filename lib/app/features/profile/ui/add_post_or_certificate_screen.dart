import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/profile/ui/widgets/app_bar_widget.dart';
import 'package:sa7b/app/features/profile/ui/widgets/posts_or_certificates/body.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:sa7b/core/helpers/spacing.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/core/widgets/custom_dropdown.dart';
import 'package:sa7b/core/widgets/custom_elevated_button.dart';

class AddPostOrCertificateScreen extends StatefulWidget {
  final String contentType;
  const AddPostOrCertificateScreen({super.key, required this.contentType});

  @override
  State<AddPostOrCertificateScreen> createState() =>
      _AddPostOrCertificateScreenState();
}

class _AddPostOrCertificateScreenState
    extends State<AddPostOrCertificateScreen> {
  String? selectedValue;

  final List<String> allSubjects = [
    'التحليل',
    'برمجة 2',
    'خوارزميات البحث',
    'الموزعة',
    'هندسة 1',
    'ادارة',
    'رياضيات',
    'عربي',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: appBarWidget(
          title:
              widget.contentType == AppStrings.addPost
                  ? widget.contentType
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
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.dm),
                  child: CustomDropdown(
                    items: allSubjects,
                    value: selectedValue,
                    hintText: AppStrings.subjectName,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                ),
                verticalSpace(25),
                Body(),
                verticalSpace(15),
                SizedBox(
                  height: 50.h,
                  width: 100.w,
                  child: CustomElevatedButton(
                    onPressed: () {},
                    text: AppStrings.publishing,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
