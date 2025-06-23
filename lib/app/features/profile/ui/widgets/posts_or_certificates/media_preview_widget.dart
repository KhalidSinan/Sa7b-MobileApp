import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:video_player/video_player.dart';

import '../../../../../../core/utils/imports_manager.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/add_new_post_cubit.dart'
    as add;
import 'package:sa7b/app/features/profile/logic/cubit/posts/edit_post_cubit.dart'
    as edit;

class MediaPreviewWidget extends StatelessWidget {
  final String screenType;
  const MediaPreviewWidget({super.key, required this.screenType});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<add.AddNewPostCubit, add.AddNewPostState>(
      buildWhen:
          (previous, current) =>
              current is add.ImagePicked ||
              current is add.VideoPicked ||
              // current is add.PdfPicked ||
              current is add.MediaCleared,
      builder: (context, state) {
        final addPostCubit = context.read<add.AddNewPostCubit>();

        return BlocBuilder<edit.EditPostCubit, edit.EditPostState>(
          buildWhen:
              (previous, current) =>
                  current is edit.ImagePicked ||
                  current is edit.VideoPicked ||
                  // current is edit.PdfPicked ||
                  current is edit.MediaCleared,

          builder: (context, addPostState) {
            final editPostCubit = context.read<edit.EditPostCubit>();

            final bool isAdd = screenType == AppStrings.addPost;

            if (isAdd
                ? addPostCubit.image != null
                : editPostCubit.image != null) {
              return Padding(
                padding: EdgeInsets.only(top: 20.dm),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.file(
                      isAdd ? addPostCubit.image! : editPostCubit.image!,
                      height: 200.h,
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: AppColors.error),
                      onPressed: () {
                        isAdd
                            ? addPostCubit.clearMedia()
                            : editPostCubit.clearMedia();
                      },
                    ),
                  ],
                ),
              );
            }

            final videoController =
                isAdd
                    ? addPostCubit.videoController
                    : editPostCubit.videoController;

            if (videoController != null &&
                videoController.value.isInitialized) {
              bool isPlaying = videoController.value.isPlaying;

              return Padding(
                padding: EdgeInsets.only(top: 20.dm),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    AspectRatio(
                      aspectRatio: videoController.value.aspectRatio,

                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          VideoPlayer(videoController),

                          IconButton(
                            icon: Icon(
                              isPlaying
                                  ? Icons.pause_circle_outline
                                  : Icons.play_circle_outline,
                              size: 48,
                              color: AppColors.white,
                            ),
                            onPressed: () {
                              isPlaying
                                  ? videoController.pause()
                                  : videoController.play();
                            },
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: AppColors.error),
                      onPressed: () {
                        isAdd
                            ? addPostCubit.clearMedia()
                            : editPostCubit.clearMedia();
                      },
                    ),
                  ],
                ),
              );
            }

            // if (isAdd
            //     ? addPostCubit.pdfFile != null
            //     : editPostCubit.pdfFile != null) {
            //   return Padding(
            //     padding: EdgeInsets.only(top: 20.dm),
            //     child: Stack(
            //       alignment: Alignment.topRight,
            //       children: [
            //         Container(
            //           height: 200.h,
            //           width: double.infinity,
            //           decoration: BoxDecoration(
            //             border: Border.all(color: AppColors.primary),
            //             borderRadius: BorderRadius.circular(12.r),
            //           ),
            //           child: Center(
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Icon(
            //                   Icons.picture_as_pdf,
            //                   size: 50.dm,
            //                   color: AppColors.error,
            //                 ),
            //                 SizedBox(height: 10),
            //                 Text(
            //                   isAdd
            //                       ? addPostCubit.pdfFile!.path.split('/').last
            //                       : editPostCubit.pdfFile!.path.split('/').last,
            //                   style: TextStyle(fontSize: AppFontSize.s14),
            //                   textAlign: TextAlign.center,
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         IconButton(
            //           icon: Icon(Icons.close, color: AppColors.error),
            //           onPressed: () {
            //             isAdd
            //                 ? addPostCubit.clearMedia()
            //                 : editPostCubit.clearMedia();
            //           },
            //         ),
            //       ],
            //     ),
            //   );
            // }

            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
