import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:sa7b/core/constants/Apis.dart';
import 'package:sa7b/core/services/api_services.dart';
import 'package:sa7b/core/domain/error_handler/network_exceptions.dart';

abstract class VoteRemoteDatasource {
  Future<void> addVote(int postId, String type);
}

class VoteRemoteDatasourceImpl implements VoteRemoteDatasource {
  final ApiServices _api = GetIt.I<ApiServices>();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  Future<void> addVote(int postId, String type) async {
    final token = await _secureStorage.read(key: 'access_token');

    try {
      final response = await _api.post(
        "${AppLink.addVote}/$postId/vote",
        body: {"type": type},
        token: token, // 🔑 لا تنسى تبدل التوكين
      );

      if (response["status"] != "success") {
        throw NetworkExceptions.defaultError(
          response["message"] ?? "فشل التصويت.",
        );
      }
    } catch (error) {
      final exception = NetworkExceptions.getException(error);
      final message = NetworkExceptions.getErrorMessage(exception);
      throw NetworkExceptions.defaultError(message);
    }
  }
}
