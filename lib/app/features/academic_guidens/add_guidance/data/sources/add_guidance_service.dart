import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:sa7b/app/features/academic_guidens/add_guidance/data/model/add_guidance_model.dart';
import 'package:sa7b/core/constants/Apis.dart';
import 'package:sa7b/core/domain/error_handler/network_exceptions.dart';
import 'package:sa7b/core/services/api_services.dart';

abstract class AddGuidanceService {
  Future<void> addAcademicGuidance(AcademicGuidanceModel model);
}

class AddAcademicGuidanceRemoteDatasourceImpl implements AddGuidanceService {
  final ApiServices _api = GetIt.I<ApiServices>();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> addAcademicGuidance(AcademicGuidanceModel model) async {
    final token = await _secureStorage.read(key: 'access_token');

    try {
      final response = await _api.post(
        AppLink.addVote,
        body: model.toJson(),
        token: token,
      );

      if (response["status"] != "success") {
        throw NetworkExceptions.defaultError(
          response["message"] ?? "فشل إضافة الإرشاد.",
        );
      }
    } catch (error) {
      final exception = NetworkExceptions.getException(error);
      final message = NetworkExceptions.getErrorMessage(exception);
      throw NetworkExceptions.defaultError(message);
    }
  }
}
