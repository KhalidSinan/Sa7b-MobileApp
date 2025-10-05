import 'package:flutter/material.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/model/subject_guidens_model.dart';
import 'package:sa7b/core/constants/Apis.dart';

class PostCardHeader extends StatelessWidget {
  final SubjectGuidensModel post;
  final bool isMyPost;
  final VoidCallback? onOptionsPressed;

  const PostCardHeader({
    super.key,
    required this.post,
    required this.isMyPost,
    this.onOptionsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFE9F5FF),
          backgroundImage: post.student?.image != null
              ? NetworkImage("${AppLink.images}/${post.student?.image}")
              : null,
          radius: 22,
          child: post.student?.image == null
              ? const Icon(Icons.person, color: Colors.blue, size: 22)
              : null,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.student?.fullName ?? "ارشادي",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Text(
              "${post.createdAt.day}/${post.createdAt.month}/${post.createdAt.year}",
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        const Spacer(),
        if (isMyPost)
          IconButton(
            icon: const Icon(Icons.more_horiz, size: 22),
            onPressed: onOptionsPressed,
          ),
      ],
    );
  }
}
