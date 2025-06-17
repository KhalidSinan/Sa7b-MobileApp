import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/app/features/send_complaint/logic/cubit/image_picker_cubit.dart';
import 'package:sa7b/app/features/send_complaint/logic/states/image_picker_state.dart';

class SendComplaintAddMedia extends StatelessWidget {
  const SendComplaintAddMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ImagePickerCubit(),
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Builder(
                    builder: (newContext) => TextButton(
                      onPressed: () => showImagePickerDialog(newContext),
                      child: Text(
                        'اضافة وسائط',
                        style: AppTextStyles.s14_medium.copyWith(color: AppColors.black),
                      ),
                    ),
                  ),
                  Icon(Icons.image, color: AppColors.third),
                ],
              ),
              BlocBuilder<ImagePickerCubit, ImagePickerState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (image) => Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.p8.h),
                      child: Image.file(image, height: AppSizes.s200.h, width:  AppSizes.s200.w,),
                    ),
                    orElse: () => const SizedBox(),
                  );
                },
              ),
            ],
          );
        }
      ),
    );
  }
}

Future<void> showImagePickerDialog(BuildContext context) async {
  final cubit = context.read<ImagePickerCubit>();

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
              cubit.pickFromGallery();
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text("التقط صورة"),
            onTap: () {
              Navigator.pop(bottomSheetContext);
              cubit.pickFromCamera();
            },
          ),
        ],
      );
    },
  );
}
