import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/send_complaint/logic/states/send_complaint_state.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

import '../../logic/cubit/send_complaint_cubit.dart';

class SendComplaintAddMedia extends StatelessWidget {
  const SendComplaintAddMedia({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SendComplaintCubit>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Builder(
              builder:
                  (newContext) => TextButton(
                    onPressed: () => showImagePickerDialog(newContext),
                    child: Text(
                      'اضافة وسائط',
                      style: AppTextStyles.s14_medium.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ),
            ),
            Icon(Icons.image, color: AppColors.third),
          ],
        ),
        BlocBuilder<SendComplaintCubit, SendComplaintState>(
          builder: (context, state) {
            return state.maybeWhen(
              imagePicked:
                  () =>
                      cubit.image != null
                          ? Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: AppSizes.p8.h,
                            ),
                            child: Stack(
                              children: [
                                Image.file(
                                  cubit.image!,
                                  height: AppSizes.s200.h,
                                  width: AppSizes.s200.w,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.close,
                                    color: AppColors.error,
                                  ),
                                  onPressed: () {
                                    cubit.clearMedia();
                                  },
                                ),
                              ],
                            ),
                          )
                          : const SizedBox(),
              orElse: () => const SizedBox(),
            );
          },
        ),
      ],
    );
  }
}

Future<void> showImagePickerDialog(BuildContext context) async {
  final cubit = context.read<SendComplaintCubit>();

  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.r20)),
    ),
    builder: (bottomSheetContext) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text("اختر من الاستوديو"),
            onTap: () {
              Navigator.pop(bottomSheetContext);
              cubit.pickImage();
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.camera_alt),
          //   title: const Text("التقط صورة"),
          //   onTap: () {
          //     Navigator.pop(bottomSheetContext);
          //     cubit.pickFromCamera();
          //   },
          // ),
        ],
      );
    },
  );
}
