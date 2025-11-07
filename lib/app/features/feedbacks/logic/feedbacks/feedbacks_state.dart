part of 'feedbacks_cubit.dart';

@freezed
class FeedbacksState with _$FeedbacksState {
  const factory FeedbacksState.initial() = _Initial;
  const factory FeedbacksState.loading() = Loading;
  const factory FeedbacksState.success(FeedbackResponse feedbacks) = Success;
  const factory FeedbacksState.error({required String errMessage}) = Error;
}
