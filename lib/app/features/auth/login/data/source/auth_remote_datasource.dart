import 'package:sa7b/core/constants/Apis.dart';
import 'package:sa7b/core/domain/error_handler/network_exceptions.dart';
import 'package:sa7b/core/services/api_services.dart';
import '../models/user_model.dart';
import 'package:get_it/get_it.dart';
abstract class LoginRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiServices _api = GetIt.I<ApiServices>();

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _api.post(
        AppLink.login,
        body: {
          "email": email,
          "password": password,
        },
      );

      return UserModel.fromJson(response);
    } catch (error) {
      final exception = NetworkExceptions.getException(error);
      final message = NetworkExceptions.getErrorMessage(exception);
      throw Exception(message);
    }
  }
}
