import 'package:flutter/material.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpeakUpScreen extends StatelessWidget {
  const SpeakUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundWhite,
          // leading: ,
          title: Text(
            "قولها ولا تخاف",
            style: AppTextStyles.s16_medium.copyWith(color: AppColors.primary),
          ),
        ),
        body: ListView(
          children: [
            Container(
              color: AppColors.white,
              child: ListTile(
                leading: Icon(Icons.arrow_back_ios, size: AppSizes.s16, color: AppColors.greyBlue,),
                title: Text("إرسال شكوى للإدارة", textDirection: TextDirection.rtl,),
                onTap: (){
                  Navigator.of(context).pushNamed('/sendComplaintScreen');
                },
              ),
            ),
            SizedBox(
              height: AppSizes.s10.h,
            ),
            Container(
              color: AppColors.white,
              child: ListTile(
                leading: Icon(Icons.arrow_back_ios, size: AppSizes.s16, color: AppColors.greyBlue,),
                title: Text("Feedbacks", textDirection: TextDirection.rtl,),
                onTap: (){
                  Navigator.of(context).pushNamed('/feedbacksScreen');
                },
              ),
            ),
          ],
        ),
    );
  }
}
