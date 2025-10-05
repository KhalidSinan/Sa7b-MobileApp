abstract class UpdateGuidanceState {}

class UpdateGuidanceInitial extends UpdateGuidanceState {}

class UpdateGuidanceLoading extends UpdateGuidanceState {}

class UpdateGuidanceSuccess extends UpdateGuidanceState {
  final String message;
  UpdateGuidanceSuccess(this.message);
}

class UpdateGuidanceError extends UpdateGuidanceState {
  final String message;
  UpdateGuidanceError(this.message);
}
