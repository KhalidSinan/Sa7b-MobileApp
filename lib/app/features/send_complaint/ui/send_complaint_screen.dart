import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/core/widgets/custom_elevated_button.dart';
import 'package:sa7b/app/features/send_complaint/ui/widgets/send_complaint_add_media.dart';
import 'package:sa7b/app/features/send_complaint/ui/widgets/send_complaint_description.dart';
import 'package:sa7b/app/features/send_complaint/ui/widgets/send_complaint_title.dart';
import 'package:sa7b/app/features/send_complaint/ui/widgets/send_complaint_type.dart';


class SendComplaintScreen extends StatelessWidget {
  const SendComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'إرسال شكوى',
                style: AppTextStyles.s16_medium.copyWith(color: AppColors.primary),
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            iconSize: AppSizes.s18.sp,
            color: AppColors.greyBlue,
            onPressed: (){
              Navigator.pop(context);
          }
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(AppSizes.p20.sp),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListView(
              children: [
                // Title
                SendComplaintTitle(),
                SizedBox(height: AppSizes.s20.h,),
                // Type
                SendComplaintType(),
                SizedBox(height: AppSizes.s20.h,),
                // Description
                SendComplaintDescription(),
                SizedBox(height: AppSizes.s20.h,),
                // Add Media
                SendComplaintAddMedia(),
                // Send Button
                Align(
                  alignment: Alignment.center,
                  child: CustomElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'إرسال',
                    width: AppSizes.s250.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
