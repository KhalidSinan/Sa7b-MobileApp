import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/post_by_id_cubit.dart';
import 'package:sa7b/app/features/profile/logic/cubit/profile/profile_cubit.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/utils/imports_manager.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/profile/certificates.dart';
import 'widgets/profile/image_and_follows_widget.dart';
import 'widgets/profile/info_card.dart';
import 'widgets/profile/posts.dart';

class ProfileScreen extends StatelessWidget {
  final bool isOwner;
  const ProfileScreen({super.key, required this.isOwner});

  @override
  Widget build(BuildContext context) {
    final profileCubit = context.read<ProfileCubit>();
    final postByIdCubit = context.read<PostByIdCubit>();
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          profileCubit.profileInfo();
          postByIdCubit.postById();
        },
        child: Scaffold(
          backgroundColor: AppColors.lightGrey,
          appBar: appBarWidget(title: AppStrings.profile, context: context),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalSpace(10),
                  ImageAndFollowsWidget(isOwner: isOwner),
                  experiences(),
                  InfoCard(isOwner: isOwner),
                  SizedBox(height: 270.h, child: Posts(isOwner: isOwner)),
                  SizedBox(
                    height: 270.h,
                    child: Certificates(isOwner: isOwner),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget experiences() {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder:
          (context, state) => state.maybeWhen(
            loading:
                () => Text(
                  'يرجى الانتظار ...',
                  style: TextStyle(
                    fontFamily: AppFonts.Cairo,
                    fontSize: AppFontSize.s12,
                    fontWeight: AppFontWeight.medium,
                    color: AppColors.darkGrey,
                  ),
                ),
            success:
                (response) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.dm,
                    vertical: 10.dm,
                  ),
                  child: Wrap(
                    children: [
                      ...response.userData.skills.map(
                        (skill) => Padding(
                          padding: EdgeInsets.only(bottom: 4.dm),
                          child: Text(
                            '${skill.skill} , ',
                            style: TextStyle(
                              fontFamily: AppFonts.Cairo,
                              fontSize: AppFontSize.s12,
                              fontWeight: AppFontWeight.medium,
                              color: AppColors.darkGrey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            orElse: () => Center(child: Text('No Experiences')),
          ),
    );
  }
}
