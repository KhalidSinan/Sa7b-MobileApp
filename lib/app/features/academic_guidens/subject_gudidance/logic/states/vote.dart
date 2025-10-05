abstract class VoteState {}

class VoteInitial extends VoteState {}

class VoteLoading extends VoteState {}

class VoteSuccess extends VoteState {
  final int newCount;
  VoteSuccess(this.newCount);
}

class VoteError extends VoteState {
  final String message;
  VoteError(this.message);
}
