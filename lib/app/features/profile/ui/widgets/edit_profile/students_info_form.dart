import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:sa7b/core/helpers/extentions.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/app/features/profile/ui/widgets/edit_profile/acadimic_year_widget.dart';
import 'package:sa7b/app/features/profile/ui/widgets/edit_profile/experience_widget.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class StudentInfoForm extends StatefulWidget {
  const StudentInfoForm({super.key});

  @override
  State<StudentInfoForm> createState() => _StudentInfoFormState();
}

class _StudentInfoFormState extends State<StudentInfoForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController linkedInController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    bioController.dispose();
    emailController.dispose();
    linkedInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _field(
            title: AppStrings.firstName,
            hintText: AppStrings.firstName,
            controller: firstNameController,
            validator:
                (value) => value!.isEmpty ? AppStrings.cantBeEmpty : null,
          ),
          _field(
            title: AppStrings.middleName,
            hintText: AppStrings.middleName,
            controller: middleNameController,
          ),
          _field(
            title: AppStrings.lastName,
            hintText: AppStrings.lastName,
            controller: lastNameController,
            validator:
                (value) => value!.isEmpty ? AppStrings.cantBeEmpty : null,
          ),
          ExperienceWidget(),
          SizedBox(height: 13.h),
          AcadimicYearWidget(),
          SizedBox(height: 13.h),
          _field(
            title: AppStrings.bio,
            hintText: AppStrings.bio,
            controller: bioController,
          ),
          _field(
            title: AppStrings.email,
            hintText: AppStrings.email,
            controller: emailController,
            validator:
                (value) => value!.isEmpty ? AppStrings.cantBeEmpty : null,
          ),
          _field(
            title: "LinkedIn",
            hintText: "LinkedIn Url",
            controller: linkedInController,
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 20.dm, top: 10.dm),
            child: CustomElevatedButton(
              width: 228,
              height: 56,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.pushReplacementNamed(Routes.profile);
                }
              },
              text: AppStrings.edit,
            ),
          ),
        ],
      ),
    );
  }

  Widget _field({
    required String title,
    required String hintText,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: EdgeInsets.all(16.0.dm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: AppFonts.Cairo,
              fontSize: AppFontSize.s12,
              color: AppColors.black,
              fontWeight: AppFontWeight.medium,
            ),
          ),
          SizedBox(
            width: 202.w,
            child: CustomTextField(
              hintText: hintText,
              controller: controller,
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
