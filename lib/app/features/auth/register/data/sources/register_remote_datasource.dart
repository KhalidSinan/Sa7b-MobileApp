import 'package:sa7b/app/features/auth/login/data/models/user_model.dart';
import 'package:sa7b/core/constants/Apis.dart';
import 'package:sa7b/core/domain/error_handler/network_exceptions.dart';
import 'package:sa7b/core/services/api_services.dart';
import 'package:get_it/get_it.dart';

abstract class RegisterRemoteDatasource {
  Future<UserModel> register(
    String firstname,
    String lastname,
    int studyYearId,
    int collageId,
    String email,
    String password,
    String passwordConfirmation,
  );
  Future<void> sendOtp(String email);
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDatasource {
  final ApiServices _api = GetIt.I<ApiServices>();

  @override
  Future<UserModel> register(
    String firstname,
    String lastname,
    int studyYearId,
    int collageId,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    try {
      final response = await _api.post(
        AppLink.register,
        body: {
          "first_name": firstname,
          "last_name": lastname,
          "study_year_id": studyYearId,
          "college_id": collageId,
          "email": email,
          "password": password,
          "password_confirmation": passwordConfirmation,
        },
      );

      if (response["success"] != true) {
        throw NetworkExceptions.defaultError(
          response["message"] ?? "فشل إنشاء الحساب.",
        );
      }

      return UserModel.fromJson(response['data']['user']);
    } catch (error) {
      final exception = NetworkExceptions.getException(error);
      final message = NetworkExceptions.getErrorMessage(exception);
      throw NetworkExceptions.defaultError(message);
    }
  }

 @override
Future<void> sendOtp(String email) async {
  try {
    final response = await _api.post(
      AppLink.askotp,
      body: {"email": email},
    );

    if (response["success"] != true) {
      throw NetworkExceptions.defaultError(
        response["message"] ?? "فشل إرسال رمز التحقق.",
      );
    }
    // إذا نجح، ما في داعي ترجّع شيء
  } catch (error) {
    final exception = NetworkExceptions.getException(error);
    final message = NetworkExceptions.getErrorMessage(exception);
    throw NetworkExceptions.defaultError(message);
  }
}

}
