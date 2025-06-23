import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/edit_post_cubit.dart';

import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/widgets/custom_text_field.dart';
import '../../../logic/cubit/posts/add_new_post_cubit.dart';

class DescriptionInputWidget extends StatelessWidget {
  final String screenType;
  const DescriptionInputWidget({super.key, required this.screenType});

  @override
  Widget build(BuildContext context) {
    final addPostCubit = context.read<AddNewPostCubit>();
    final editPostCubit = context.read<EditPostCubit>();

    return SizedBox(
      height: 260.h,
      child: CustomTextField(
        controller:
            screenType == AppStrings.addPost
                ? addPostCubit.descriptionController
                : editPostCubit.descriptionController,
        hintText: AppStrings.writeWhateverYouWant,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return AppStrings.cantBeEmpty;
          } else if (value.length <= 10) {
            return 'الوصف يجب أن يكون أكثر من 10 أحرف';
          }
          return null;
        },
      ),
    );
  }
}
