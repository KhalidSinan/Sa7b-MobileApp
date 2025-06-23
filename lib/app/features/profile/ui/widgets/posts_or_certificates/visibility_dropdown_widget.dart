import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/edit_post_cubit.dart';

import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/widgets/custom_dropdown.dart';
import '../../../logic/cubit/posts/add_new_post_cubit.dart';

class VisibilityDropdownWidget extends StatelessWidget {
  final String screenType;

  const VisibilityDropdownWidget({super.key, required this.screenType});

  @override
  Widget build(BuildContext context) {
    final addPostCubit = context.read<AddNewPostCubit>();
    final editPostCubit = context.read<EditPostCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.dm),
      child: CustomDropdown(
        items:
            screenType == AppStrings.addPost
                ? addPostCubit.visibilityOptions
                : editPostCubit.visibilityOptions,
        value:
            screenType == AppStrings.addPost
                ? addPostCubit.selectedVisibility
                : editPostCubit.selectedVisibility,
        hintText: AppStrings.visibilityName,
        onChanged: (value) {
          screenType == AppStrings.addPost
              ? addPostCubit.selectedVisibility = value!
              : editPostCubit.selectedVisibility = value!;
        },
        validator: (value) {
          if (value == null) {
            return 'الرجاء تحديد حالة الظهور';
          }
          return null;
        },
      ),
    );
  }
}
