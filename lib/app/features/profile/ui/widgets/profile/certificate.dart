import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/constants/app_strings.dart';

import '../../../../../../core/utils/imports_manager.dart';
import 'option_for_edit_or_delete_post.dart';
import 'post_or_certificate_card.dart';
import 'post_or_certificate_header_section.dart';

class Certificate extends StatelessWidget {
  final bool isOwner;
  const Certificate({super.key, required this.isOwner});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(thickness: 1.dm, color: AppColors.lightBlueMist),
        PostOrCertificateHeaderSection(
          title: AppStrings.certificate,
          onPressedShowMore: () {},
        ),
        SizedBox(
          height: 185.h,
          width: double.infinity,
          child: ListView.builder(
            itemBuilder:
                (context, index) => PostOrCertificateCard(
                  userName: 'Ruba sawan',
                  date: '3/4/2025',
                  content: "Diploma in Information Engineering",
                  profileImage: Icons.person,
                  onShowPopupMenu: () {
                    onMoreOptionsPressed(
                      context: context,
                      onPressedDelete: () {},
                      onPressedEdit: () {},
                    );
                  },
                  isOwner: isOwner,
                ),
            itemCount: 2,
          ),
        ),
      ],
    );
  }
}
