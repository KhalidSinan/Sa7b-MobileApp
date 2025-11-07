import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sa7b/app/features/feedbacks/data/models/feedback_by_id_response.dart';
import 'package:sa7b/app/features/feedbacks/data/models/feedback_question_response.dart';

import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../data/models/feedback_question_request_body.dart';
import '../../data/repos/feedback_question_repo.dart';

part 'feedback_question_state.dart';
part 'feedback_question_cubit.freezed.dart';

class FeedbackQuestionCubit extends Cubit<FeedbackQuestionState> {
  final FeedbackQuestionRepo _feedbackQuestionRepo;
  FeedbackQuestionCubit(this._feedbackQuestionRepo)
    : super(FeedbackQuestionState.initial());

  final formKey = GlobalKey<FormState>();

  Future<void> feedbackQuestion({
    required String title,
    required List<FeedbackAnswer> feedbackAnswers,
    required int feedbackId,
  }) async {
    if (!formKey.currentState!.validate()) return;

    emit(FeedbackQuestionState.loading());
    try {
      final request = FeedbackQuestionRequestBody(
        content: title,
        userId: 27, //! should be saved in shared prefs after login
        feedbackAnswers: feedbackAnswers,
      );
      final response = await _feedbackQuestionRepo.feedbackQuestion(
        request,
        feedbackId,
      );

      emit(FeedbackQuestionState.successSubmitQuestion(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(FeedbackQuestionState.error(message));
    }
  }

  Future<void> feedbackById(int feedbackId) async {
    emit(FeedbackQuestionState.loading());
    try {
      final feedback = await _feedbackQuestionRepo.feedbackById(feedbackId);
      emit(FeedbackQuestionState.successGetFeedbackById(feedback));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(FeedbackQuestionState.error(message));
    }
  }
}
