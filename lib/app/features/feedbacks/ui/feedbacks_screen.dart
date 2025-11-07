import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/feedbacks/logic/feedbacks/feedbacks_cubit.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:sa7b/core/helpers/extentions.dart';
import 'package:sa7b/core/helpers/spacing.dart';
import 'package:sa7b/core/routing/routes.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/core/widgets/loading_widget.dart';

class FeedbacksScreen extends StatelessWidget {
  const FeedbacksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FeedbacksCubit>();
    return RefreshIndicator(
      onRefresh: () async {
        cubit.feedbacks();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                AppStrings.feedbacks,
                style: AppTextStyles.s16_medium.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            iconSize: AppSizes.s18,
            color: AppColors.greyBlue,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocBuilder<FeedbacksCubit, FeedbacksState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () => const LoadingWidget(),
              error:
                  (error) => Center(
                    child: TextButton(
                      onPressed: () => cubit.feedbacks(),
                      child: Text(
                        "  $error \nاضغط لاعادة المحاولة",
                        style: AppTextStyles.s14_medium.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ),
              success:
                  (feedbacks) => ListView.builder(
                    padding: EdgeInsets.all(AppSizes.p16),
                    itemCount: feedbacks.data.length,
                    itemBuilder: (context, index) {
                      final item = feedbacks.data[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: AppSizes.p16),
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to the questions feedback screen
                            context.pushNamed(
                              Routes.feedbackQuestionsScreen,
                              arguments: item.id,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(AppSizes.p16),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(AppSizes.r16),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.greyBlue,
                                  blurRadius: 6.r,
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
                                        item.course.name,
                                        style: AppTextStyles.s14_medium,
                                      ),
                                      verticalSpace(8),
                                      Text(
                                        item.createdAt,
                                        style: AppTextStyles.s12_medium
                                            .copyWith(color: AppColors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                horizontalSpace(8),
                                CircleAvatar(
                                  backgroundColor: AppColors.primary,
                                  child: Icon(
                                    Icons.chat_outlined,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
      ),
    );
  }
}
