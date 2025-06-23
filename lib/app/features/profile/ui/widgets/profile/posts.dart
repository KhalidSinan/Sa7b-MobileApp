import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/post_by_id_cubit.dart';
import 'package:sa7b/core/constants/app_strings.dart';
import 'package:sa7b/core/helpers/extentions.dart';
import 'package:sa7b/core/routing/routes.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/core/widgets/loading_widget.dart';

import 'option_for_edit_or_delete_post.dart';
import 'post_or_certificate_card.dart';
import 'post_or_certificate_header_section.dart';

class Posts extends StatelessWidget {
  final bool isOwner;
  const Posts({super.key, required this.isOwner});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(thickness: 1.dm, color: AppColors.lightBlueMist),
        PostOrCertificateHeaderSection(
          title: AppStrings.posts,
          onPressedShowMore: () {
            context.pushNamed(
              Routes.postsOrCertificates,
              arguments: {'isOwner': isOwner},
            );
          },
        ),
        SizedBox(
          height: 185.h,
          width: double.infinity,
          child: BlocBuilder<PostByIdCubit, PostByIdState>(
            builder:
                (context, state) => state.maybeWhen(
                  loading: () => LoadingWidget(),

                  success:
                      (postById) => ListView.builder(
                        itemBuilder:
                            (context, index) => PostOrCertificateCard(
                              userName: postById.data!.studentName.toString(),
                              date: postById.data!.files[0].createdAt,
                              content: postById.data!.description.toString(),
                              onShowPopupMenu: () {
                                onMoreOptionsPressed(
                                  context: context,
                                  onPressedDelete: () {},
                                  onPressedEdit: () {},
                                );
                              },
                              isOwner: isOwner,
                              attachmentPath: AppImages.defaultProfileImage,
                            ),
                        itemCount: 1,
                      ),

                  error:
                      (error) => Center(child: Text('No Posts Found $error')),

                  orElse: () => LoadingWidget(),
                ),
          ),
        ),
      ],
    );
  }
}
