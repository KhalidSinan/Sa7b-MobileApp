import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/profile/logic/cubit/profile/profile_cubit.dart';
import 'package:sa7b/core/widgets/custom_elevated_button.dart';

import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/imports_manager.dart';
import '../../../../../../core/widgets/loading_widget.dart';

class ImageAndFollowsWidget extends StatelessWidget {
  final bool isOwner;
  const ImageAndFollowsWidget({super.key, required this.isOwner});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder:
          (context, state) => state.maybeWhen(
            loading: () => const LoadingWidget(),
            error: (error) => Text(error),
            success: (response) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50.r,
                    backgroundColor: AppColors.black,
                    backgroundImage:
                        response.userData?.image != null
                            ? NetworkImage(response.userData!.image!)
                            : AssetImage(AppImages.defaultProfileImage)
                                as ImageProvider,
                  ),
                  Column(
                    children: [
                      Text(
                        '${response.userData?.firstName.toString()} ${response.userData?.lastName.toString()}',
                        style: TextStyle(
                          fontSize: AppFontSize.s16,
                          fontFamily: AppFonts.Cairo,
                          color: AppColors.greyBlue,
                        ),
                      ),
                      verticalSpace(20),
                      Row(
                        children: [
                          postsAndFollowsCounter(
                            counter: 34,
                            title: AppStrings.posts,
                          ),
                          horizontalSpace(35),
                          postsAndFollowsCounter(
                            counter: 500,
                            title: AppStrings.followers,
                          ),
                          horizontalSpace(35),
                          postsAndFollowsCounter(
                            counter: 78,
                            title: AppStrings.follows,
                          ),
                        ],
                      ),
                      verticalSpace(10),
                      if (!isOwner)
                        CustomElevatedButton(
                          onPressed: () async {
                            final userId = response.userData?.id;
                            if (profileCubit.isFollowing) {
                              await profileCubit.unFollowUser(userId!);
                            } else {
                              await profileCubit.followUser(userId!);
                            }
                            profileCubit.isFollowing =
                                !profileCubit.isFollowing;

                            profileCubit.profileInfo();
                          },
                          text:
                              profileCubit.isFollowing
                                  ? AppStrings.followed
                                  : AppStrings.follows,
                          backgroundColor:
                              profileCubit.isFollowing
                                  ? AppColors.grey
                                  : AppColors.primary,
                          textStyle: TextStyle(
                            fontSize: AppFontSize.s14,
                            fontWeight: AppFontWeight.medium,
                            color: AppColors.white,
                          ),
                        ),
                      verticalSpace(10),
                    ],
                  ),
                ],
              );
            },

            orElse: () => SizedBox.shrink(),
          ),
    );
  }

  Widget postsAndFollowsCounter({required int counter, required String title}) {
    return Column(
      children: [
        Text(counter.toString()),
        Text(
          title,
          style: TextStyle(
            fontFamily: AppFonts.Cairo,
            fontSize: AppFontSize.s10.dm,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
