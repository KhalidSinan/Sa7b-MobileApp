import 'package:flutter/material.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/model/subject_guidens_model.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/ui/widgets/post_content.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/ui/widgets/post_header.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/ui/widgets/post_voting.dart';

class PostCard extends StatelessWidget {
  final SubjectGuidensModel post;
  final bool isMyPost;
  final int initialVotes;
  final ValueChanged<int>? onVoteUpdated;
  final VoidCallback? onUpdated;

  const PostCard({
    super.key,
    required this.post,
    required this.isMyPost,
    required this.initialVotes,
    this.onVoteUpdated,
    this.onUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostCardHeader(
            post: post,
            isMyPost: isMyPost,
            onOptionsPressed: () => _showOptionsMenu(context),
          ),
          const SizedBox(height: 12),
          PostCardContent(post: post),
          const SizedBox(height: 12),
          PostVoting(
            postId: post.id,
            initialVotes: initialVotes,
            onVoteUpdated: onVoteUpdated,
          ),
        ],
      ),
    );
  }

  // خيارات التعديل والحذف تبقى كما هي
  void _showOptionsMenu(BuildContext context) {
    // ... نفس الكود القديم
  }
}
