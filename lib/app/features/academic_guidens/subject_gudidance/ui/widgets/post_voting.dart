import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/sources/vote_service.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/logic/cubits/vote.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/logic/states/vote.dart';

class PostVoting extends StatelessWidget {
  final int postId;
  final int initialVotes;
  final ValueChanged<int>? onVoteUpdated;

  const PostVoting({
    super.key,
    required this.postId,
    required this.initialVotes,
    this.onVoteUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => VoteCubit(VoteRemoteDatasourceImpl(), initialVotes),
      child: BlocBuilder<VoteCubit, VoteState>(
        builder: (context, state) {
          final cubit = context.read<VoteCubit>();
          int currentVotes = state is VoteSuccess ? state.newCount : cubit.currentCount;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      cubit.addVote(postId, "up").then((_) {
                        onVoteUpdated?.call(cubit.currentCount);
                      });
                    },
                    icon: const Icon(Icons.arrow_circle_up_rounded, size: 26),
                    color: Colors.black54,
                  ),
                  Text(
                    "$currentVotes",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.addVote(postId, "down").then((_) {
                        onVoteUpdated?.call(cubit.currentCount);
                      });
                    },
                    icon: const Icon(Icons.arrow_circle_down_rounded, size: 26),
                    color: Colors.black54,
                  ),
                ],
              ),
              if (state is VoteLoading) const LinearProgressIndicator(),
              if (state is VoteError)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red, fontSize: 13),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
