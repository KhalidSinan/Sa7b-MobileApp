import 'package:dio/dio.dart';

import '../../../../../core/data/sources/remote/app_url.dart';
import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../../core/services/api_services_impl.dart';
import '../models/feedback_by_id_response.dart';
import '../models/feedback_question_request_body.dart';
import '../models/feedback_question_response.dart';

abstract class FeedbackQuestionRemoteDataSource {
  Future<FeedbackQuestionResponse> feedbackQuestion(
    FeedbackQuestionRequestBody request,
    int questionId,
  );

  Future<FeedbackByIdResponse> feedbackById(int feedbackId);
}

class FeedbackQuestionRemoteDataSourceImp
    implements FeedbackQuestionRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  FeedbackQuestionRemoteDataSourceImp({required this.apiServicesImpl});

  @override
  Future<FeedbackQuestionResponse> feedbackQuestion(
    FeedbackQuestionRequestBody request,
    int feedbackId,
  ) async {
    final response = FeedbackQuestionRequestBody(
      content: request.content,
      userId: request.userId,
      feedbackAnswers: request.feedbackAnswers,
    );

    try {
      final result = await apiServicesImpl.post(
        "${AppUrl.feedbacks}/$feedbackId/${AppUrl.submitFeedbacks}",
        body: response.toJson(),
      );
      return FeedbackQuestionResponse.fromJson(result);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }

  @override
  Future<FeedbackByIdResponse> feedbackById(int feedbackId) async {
    try {
      final feedbackById = await apiServicesImpl.get(
        "${AppUrl.feedbacks}/$feedbackId",
      );
      return FeedbackByIdResponse.fromJson(feedbackById);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
