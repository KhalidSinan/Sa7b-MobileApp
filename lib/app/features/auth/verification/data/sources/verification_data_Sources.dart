import 'package:get_it/get_it.dart';
import 'package:sa7b/core/constants/Apis.dart';
import 'package:sa7b/core/domain/error_handler/network_exceptions.dart';
import 'package:sa7b/core/services/api_services.dart';

abstract class VerificationDataSources {
  Future<void> verifyCode(String email, String code);
}

class VerificationRemoteDataSourceImpl implements VerificationDataSources {
  final ApiServices _api = GetIt.I<ApiServices>();

  @override
  Future<void> verifyCode(String email, String code) async {
    final response = await _api.post(
      AppLink.verifyOtp,
      body: {"email": email, "otp": code},
    );

    if (response["success"] != true) {
      throw NetworkExceptions.defaultError(
        response["message"] ?? "فشل التحقق من الكود.",
      );
    }
  }
}
