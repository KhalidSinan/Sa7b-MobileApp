import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/edit_post_cubit.dart';

import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/imports_manager.dart';
import '../../../logic/cubit/posts/add_new_post_cubit.dart';

class AddMediaButtonsWidget extends StatelessWidget {
  final String screenType;
  const AddMediaButtonsWidget({super.key, required this.screenType});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewPostCubit, AddNewPostState>(
      builder: (context, addPostState) {
        final addPostCubit = context.read<AddNewPostCubit>();

        return BlocBuilder<EditPostCubit, EditPostState>(
          builder: (context, editPostState) {
            final editPostCubit = context.read<EditPostCubit>();

            final bool isAdd = screenType == AppStrings.addPost;

            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(AppStrings.addMedia),
                horizontalSpace(10),
                IconButton(
                  icon: Icon(Icons.video_library, color: AppColors.primary),
                  onPressed: () async {
                    if (isAdd) {
                      addPostCubit.pickVideo();
                    } else {
                      editPostCubit.pickVideo();
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.image, color: AppColors.error),
                  onPressed: () async {
                    if (isAdd) {
                      addPostCubit.pickImage();
                    } else {
                      editPostCubit.pickImage();
                    }
                  },
                ),
                // IconButton(
                //   icon: Icon(Icons.file_copy, color: AppColors.error),
                //   onPressed: () async {
                //     if (isAdd) {
                //       addPostCubit.pickPdf();
                //     } else {
                //       editPostCubit.pickPdf();
                //     }
                //   },
                // ),
              ],
            );
          },
        );
      },
    );
  }
}
