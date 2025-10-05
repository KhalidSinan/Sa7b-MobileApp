import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:sa7b/core/constants/Apis.dart';
import 'package:sa7b/core/domain/error_handler/network_exceptions.dart';
import 'package:sa7b/core/services/api_services.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/model/subject_guidens_model.dart';

abstract class DateFilterService {
  Future<List<SubjectGuidensModel>> fetchPostsByDate({
    required String startDate,
    required String endDate,
  });
}

class DateFilterRemoteDatasourceImpl implements DateFilterService {
  final ApiServices _api = GetIt.I<ApiServices>();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<List<SubjectGuidensModel>> fetchPostsByDate({
    required String startDate,
    required String endDate,
  }) async {
    final token = await _secureStorage.read(key: 'access_token');

    try {
      final response = await _api.post(
        AppLink.addVote, // لازم يكون عندك الرابط معرف بـ Apis.dart
        body: {
          "start_date": startDate,
          "end_date": endDate,
        },
        token: token,
      );

      if (response["status"] == "success") {
        final data = response["data"] as List;
        return data.map((e) => SubjectGuidensModel.fromJson(e)).toList();
      } else {
        throw NetworkExceptions.defaultError(
          response["message"] ?? "فشل في جلب البيانات.",
        );
      }
    } catch (error) {
      final exception = NetworkExceptions.getException(error);
      final message = NetworkExceptions.getErrorMessage(exception);
      throw NetworkExceptions.defaultError(message);
    }
  }
}
