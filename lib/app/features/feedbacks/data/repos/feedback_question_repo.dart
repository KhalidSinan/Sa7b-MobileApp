import 'package:sa7b/core/services/network_info.dart';

import '../../../../../../core/domain/error_handler/network_exceptions.dart';
import '../datasources/feedback_question_remote_data_source.dart';
import '../models/feedback_by_id_response.dart';
import '../models/feedback_question_request_body.dart';
import '../models/feedback_question_response.dart';

class FeedbackQuestionRepo {
  final FeedbackQuestionRemoteDataSource feedbackQuestionRemoteDataSource;
  final NetworkInfo networkInfo;

  FeedbackQuestionRepo({
    required this.feedbackQuestionRemoteDataSource,
    required this.networkInfo,
  });

  Future<FeedbackQuestionResponse> feedbackQuestion(
    FeedbackQuestionRequestBody requset,
    int feedbackId,
  ) async {
    final FeedbackQuestionRequestBody requestBody = FeedbackQuestionRequestBody(
      content: requset.content,
      userId: requset.userId,
      feedbackAnswers: requset.feedbackAnswers,
    );
    if (await networkInfo.isConnected) {
      try {
        final response = await feedbackQuestionRemoteDataSource
            .feedbackQuestion(requestBody, feedbackId);
        return response;
      } catch (e) {
        final exception = NetworkExceptions.getException(e);
        throw exception;
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<FeedbackByIdResponse> feedbackById(int feedbackId) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await feedbackQuestionRemoteDataSource.feedbackById(feedbackId);
        return response;
      } catch (e) {
        final exception = NetworkExceptions.getException(e);
        throw exception;
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
