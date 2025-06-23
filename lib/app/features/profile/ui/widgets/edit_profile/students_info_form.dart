import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/profile/logic/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:sa7b/core/helpers/extentions.dart';
import 'package:sa7b/core/helpers/spacing.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/app/features/profile/ui/widgets/edit_profile/acadimic_year_widget.dart';
import 'package:sa7b/app/features/profile/ui/widgets/edit_profile/experience_widget.dart';
import 'package:sa7b/core/widgets/loading_widget.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../../core/widgets/custom_text_field.dart';

class StudentInfoForm extends StatelessWidget {
  final String email;
  const StudentInfoForm({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final editProfileCubit = context.read<EditProfileCubit>();

    return Form(
      key: editProfileCubit.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(email.toString()),
          _field(
            title: AppStrings.firstName,
            hintText: AppStrings.firstName,
            controller: editProfileCubit.firstNameController,
            validator:
                (value) => value!.isEmpty ? AppStrings.cantBeEmpty : null,
            keyboardType: TextInputType.name,
          ),
          _field(
            title: AppStrings.middleName,
            hintText: AppStrings.middleName,
            controller: editProfileCubit.middleNameController,
            validator:
                (value) => value!.isEmpty ? AppStrings.cantBeEmpty : null,
            keyboardType: TextInputType.name,
          ),
          _field(
            title: AppStrings.lastName,
            hintText: AppStrings.lastName,
            controller: editProfileCubit.lastNameController,
            validator:
                (value) => value!.isEmpty ? AppStrings.cantBeEmpty : null,
            keyboardType: TextInputType.name,
          ),
          ExperienceWidget(
            onExperiencesChanged: (experiences) {
              editProfileCubit.selectedSkills = experiences;
            },
          ),
          verticalSpace(13),
          AcadimicYearWidget(
            onYearSelected: (year) {
              editProfileCubit.selectedAcademicYear = year;
            },
          ),
          verticalSpace(13),
          _field(
            title: AppStrings.bio,
            hintText: AppStrings.bio,
            controller: editProfileCubit.bioController,
            validator:
                (value) => value!.isEmpty ? AppStrings.cantBeEmpty : null,
            keyboardType: TextInputType.text,
          ),
          _field(
            title: "رقم الموبايل",
            hintText: "رقم الموبايل",
            controller: editProfileCubit.phoneNumberController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.cantBeEmpty;
              } else if (value.length != 10) {
                return 'يجب أن يكون  10 ارقام';
              }
              return null;
            },
            keyboardType: TextInputType.phone,
          ),

          // _field(title: AppStrings.email, hintText: email, readOnly: true),
          _field(
            title: "LinkedIn",
            hintText: "LinkedIn Url",
            controller: editProfileCubit.linkedInController,
            keyboardType: TextInputType.url,
          ),
          _field(
            title: "Facebook",
            hintText: "Facebook Url",
            controller: editProfileCubit.facebookController,
            keyboardType: TextInputType.url,
          ),
          _field(
            title: "Github",
            hintText: "Github Url",
            controller: editProfileCubit.githubController,
            keyboardType: TextInputType.url,
          ),
          _field(
            title: "X Account",
            hintText: "X Account Url",
            controller: editProfileCubit.xAccountController,
            keyboardType: TextInputType.url,
          ),

          BlocConsumer<EditProfileCubit, EditProfileState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (message) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(message)));
                  context.pushReplacementNamed(Routes.profile);
                },
                error: (error) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(error)));
                },
              );
            },
            builder:
                (context, state) => state.maybeWhen(
                  loading: () => LoadingWidget(),
                  orElse:
                      () => Padding(
                        padding: EdgeInsets.only(bottom: 20.dm, top: 10.dm),
                        child: CustomElevatedButton(
                          width: 228,
                          height: 56,
                          onPressed: () {
                            if (editProfileCubit.formKey.currentState!
                                .validate()) {
                              editProfileCubit.editProfile();
                            }
                          },
                          text: AppStrings.edit,
                        ),
                      ),
                ),
          ),
        ],
      ),
    );
  }

  Widget _field({
    required String title,
    required String hintText,
    TextEditingController? controller,
    String? Function(String?)? validator,
    bool readOnly = false,
    TextInputType? keyboardType,
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
              readOnly: readOnly,
              keyboardType: keyboardType,
            ),
          ),
        ],
      ),
    );
  }
}
