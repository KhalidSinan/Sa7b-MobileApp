import 'package:flutter/material.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/model/subject_guidens_model.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/ui/widgets/post_card.dart';

class PostsTabView extends StatelessWidget {
  final List<SubjectGuidensModel> posts;
  final bool isMyPosts;
  final Map<int, int> localVotes;
  final ValueChanged<int> Function(int) onVoteUpdated;
  final VoidCallback onUpdated;

  const PostsTabView({
    super.key,
    required this.posts,
    required this.isMyPosts,
    required this.localVotes,
    required this.onVoteUpdated,
    required this.onUpdated,
  });

  List<SubjectGuidensModel> filterPosts(String type) =>
      posts.where((post) => post.type == type).toList();

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        buildPostsList(filterPosts("theoretical")),
        buildPostsList(filterPosts("practical")),
        buildPostsList(filterPosts("benefit")),
      ],
    );
  }

  Widget buildPostsList(List<SubjectGuidensModel> postsList) {
    if (postsList.isEmpty) return const Center(child: Text("لا يوجد منشورات"));

    return ListView.builder(
      itemCount: postsList.length,
      itemBuilder: (context, index) {
        final post = postsList[index];
        return PostCard(
          post: post,
          isMyPost: isMyPosts,
          initialVotes: localVotes[post.id] ?? post.voteCount,
          onVoteUpdated: onVoteUpdated(post.id),
          onUpdated: onUpdated,
        );
      },
    );
  }
}