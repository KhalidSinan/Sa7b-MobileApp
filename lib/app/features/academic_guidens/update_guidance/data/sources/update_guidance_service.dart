import 'package:get_it/get_it.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sa7b/app/features/academic_guidens/update_guidance/data/model/update_guidance_model.dart';
import 'package:sa7b/core/constants/Apis.dart';
import 'package:sa7b/core/domain/error_handler/network_exceptions.dart';
import 'package:sa7b/core/services/api_services.dart';

abstract class UpdateGuidanceRemoteDatasource {
  Future<void> updateGuidance(UpdateGuidanceModel model);
}

class UpdateGuidanceRemoteDatasourceImpl
    implements UpdateGuidanceRemoteDatasource {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final ApiServices _api = GetIt.I<ApiServices>();

  @override
  Future<void> updateGuidance(UpdateGuidanceModel model) async {
    final token = await _secureStorage.read(key: 'access_token');

    try {
      final response = await _api.post(
        "${AppLink.updatreGuidance}/${model.id}",
        token: token,
        body: model.toJson(),
      );

      if (response["status"] != "success") {
        throw NetworkExceptions.defaultError(
          response["message"] ?? "فشل تعديل الإرشاد الأكاديمي.",
        );
      }
    } catch (error) {
      final exception = NetworkExceptions.getException(error);
      final message = NetworkExceptions.getErrorMessage(exception);
      throw NetworkExceptions.defaultError(message);
    }
  }
}
