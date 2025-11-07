import 'package:dio/dio.dart';
import 'package:sa7b/core/data/sources/remote/app_url.dart';

import '../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../../../core/services/api_services_impl.dart';
import '../models/feedbacks_response.dart';

abstract class FeedbacksRemoteDataSource {
  Future<FeedbackResponse> feedbacks();
}

class FeedbacksRemoteDataSourceImp
    implements FeedbacksRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  FeedbacksRemoteDataSourceImp({required this.apiServicesImpl});

  @override
  Future<FeedbackResponse> feedbacks() async {
    try {
      final feedbacks = await apiServicesImpl.get(AppUrl.feedbacks);
      return FeedbackResponse.fromJson(feedbacks);
    } on DioException catch (e) {
      throw NetworkExceptions.getException(e);
    } catch (e) {
      throw NetworkExceptions.getException(e);
    }
  }
}
