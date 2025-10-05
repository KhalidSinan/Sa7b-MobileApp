import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/sources/vote_service.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/logic/states/vote.dart';

class VoteCubit extends Cubit<VoteState> {
  final VoteRemoteDatasource voteService;
  int currentCount;

  VoteCubit(this.voteService, this.currentCount) : super(VoteInitial());

  Future<void> addVote(int postId, String type) async {
    emit(VoteLoading());
    try {
      await voteService.addVote(postId, type);

      // لو زر up زدنا، لو down نقصنا
      if (type == "up") {
        currentCount++;
      } else {
        currentCount--;
      }

      emit(VoteSuccess(currentCount));
    } catch (e) {
      emit(VoteError(e.toString()));
    }
  }
}
