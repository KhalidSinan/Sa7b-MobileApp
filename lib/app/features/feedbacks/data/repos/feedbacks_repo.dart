import 'package:sa7b/core/services/network_info.dart';

import '../../../../../../core/domain/error_handler/network_exceptions.dart';
import '../datasources/feedbacks_remote_data_source.dart';
import '../models/feedbacks_response.dart';

class FeedbacksRepo {
  final FeedbacksRemoteDataSource feedbacksRemoteDataSource;
  final NetworkInfo networkInfo;

  FeedbacksRepo({
    required this.feedbacksRemoteDataSource,
    required this.networkInfo,
  });

  Future<FeedbackResponse> feedbacks() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await feedbacksRemoteDataSource.feedbacks();
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
