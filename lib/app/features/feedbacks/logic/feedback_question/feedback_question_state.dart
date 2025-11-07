part of 'feedback_question_cubit.dart';

@freezed
class FeedbackQuestionState with _$FeedbackQuestionState {
  const factory FeedbackQuestionState.initial() = Initial;
  const factory FeedbackQuestionState.loading() = Loading;
  const factory FeedbackQuestionState.successSubmitQuestion(
    FeedbackQuestionResponse response,
  ) = SuccessSubmitQuestion;
  const factory FeedbackQuestionState.successGetFeedbackById(
    FeedbackByIdResponse response,
  ) = SuccessGetFeedbackById;
  const factory FeedbackQuestionState.error(String errMessage) = Error;
}
