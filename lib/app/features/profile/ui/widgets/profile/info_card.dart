import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/profile/logic/cubit/profile/profile_cubit.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:sa7b/core/helpers/extentions.dart';
import 'package:sa7b/core/helpers/spacing.dart';
import 'package:sa7b/core/routing/routes.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/core/widgets/loading_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoCard extends StatelessWidget {
  final bool isOwner;
  const InfoCard({super.key, required this.isOwner});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.dm, vertical: 10.dm),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20.dm),
            padding: EdgeInsets.symmetric(vertical: 16.dm, horizontal: 12.dm),
            decoration: BoxDecoration(
              color: AppColors.lightBlueMist,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder:
                  (context, state) => state.maybeWhen(
                    loading: () => const LoadingWidget(),
                    success:
                        (userData) => Column(
                          children: [
                            infoRow(
                              label: AppStrings.linkedIn,
                              value:
                                  userData.userData.linkedInAccount.toString(),
                            ),
                            verticalSpace(8),
                            infoRow(
                              label: AppStrings.facebook,
                              value:
                                  userData.userData.facebookAccount.toString(),
                            ),
                            verticalSpace(8),
                            infoRow(
                              label: AppStrings.gitHub,
                              value: userData.userData.githubAccount.toString(),
                            ),
                            verticalSpace(8),
                            infoRow(
                              label: AppStrings.xAccount,
                              value: userData.userData.xAccount.toString(),
                            ),
                            verticalSpace(8),
                            infoRow(
                              label: AppStrings.acadimicYear,
                              value: userData.userData.academicYear!.year.toString(),
                            ),
                            verticalSpace(8),
                            infoRow(
                              label: AppStrings.college,
                              value: userData.userData.collegeName.toString(),
                            ),
                          ],
                        ),
                    error:
                        (error) => SizedBox(
                          child: Center(child: Text(error.toString())),
                        ),
                    orElse: () {
                      return SizedBox(child: Text('no data to view'));
                    },
                  ),
            ),
          ),
          if (isOwner)
            Positioned(left: 3.dm, top: -10.dm, child: editButton(context)),
        ],
      ),
    );
  }

  Widget infoRow({@required String? label, required String value}) {
    bool isUrl(String text) {
      final urlPattern = RegExp(
        r'^(https?:\/\/)?([\w\-]+\.)+[\w]{2,}(\/\S*)?$',
        caseSensitive: false,
      );
      return urlPattern.hasMatch(text);
    }

    Widget buildValueWidget(String value) {
      if (isUrl(value)) {
        final shortened =
            value.length > 20 ? '${value.substring(0, 20)}...' : value;

        return InkWell(
          onTap: () async {
            final String cleanedValue = value.trim();
            final String fullUrl =
                cleanedValue.startsWith("http")
                    ? cleanedValue
                    : "https://$cleanedValue";
            final uri = Uri.parse(fullUrl);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          },
          child: Text(
            shortened,
            style: const TextStyle(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primary,
            ),
          ),
        );
      } else {
        final displayText =
            value.length > 30 ? '${value.substring(0, 30)}...' : value;
        return Text(
          displayText,
          style: TextStyle(
            fontFamily: AppFonts.Cairo,
            fontSize: AppFontSize.s12,
            color: AppColors.slateGray,
          ),
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: buildValueWidget(value)),
        Text(
          label ?? "No Account Found",
          style: TextStyle(
            fontFamily: AppFonts.Cairo,
            fontSize: AppFontSize.s12,
            color: AppColors.slateGray,
          ),
        ),
      ],
    );
  }

  Widget editButton(BuildContext context) {
    return CircleAvatar(
      radius: 18.r,
      backgroundColor: AppColors.primary,
      child: IconButton(
        icon: Icon(Icons.edit, size: 16.dm, color: AppColors.white),
        onPressed: () {
          context.pushNamed(Routes.editProfile);
        },
      ),
    );
  }
}
