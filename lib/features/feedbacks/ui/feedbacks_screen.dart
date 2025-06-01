import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/features/feedbacks/data/feedbacks.dart';

class FeedbacksScreen extends StatelessWidget {
  const FeedbacksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedbacks',
          style: AppTextStyles.s16_medium.copyWith(color: AppColors.primary),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            iconSize: AppSizes.s18,
            color: AppColors.greyBlue,
            onPressed: (){
              Navigator.pop(context);
            }
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(AppSizes.p16),
        itemCount: feedbacksList.length,
        itemBuilder: (context, index){
          final item = feedbacksList[index];
          return Padding(
            padding: EdgeInsets.only(bottom: AppSizes.p16),
            child: Container(
              padding: EdgeInsets.all(AppSizes.p16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(AppSizes.r16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyBlue.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          item['title']!,
                          style: AppTextStyles.s14_medium,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Text(
                          item['date']!,
                          style: AppTextStyles.s12_medium.copyWith(color: AppColors.grey),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8.w),
                  CircleAvatar(
                    backgroundColor: AppColors.primary.withOpacity(0.1),
                    child: Icon(Icons.chat_outlined, color: AppColors.primary),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
