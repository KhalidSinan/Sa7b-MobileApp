import 'package:get_it/get_it.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/model/subject_guidens_model.dart';
import 'package:sa7b/core/constants/Apis.dart';
import 'package:sa7b/core/domain/error_handler/network_exceptions.dart';
import 'package:sa7b/core/services/api_services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class MyPostsRemoteDatasource {
  Future<List<SubjectGuidensModel>> getMyPosts();
}

class MyPostsRemoteDatasourceImpl implements MyPostsRemoteDatasource {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  final ApiServices _api = GetIt.I<ApiServices>();

  @override
  Future<List<SubjectGuidensModel>> getMyPosts() async {
    final token = await _secureStorage.read(key: 'access_token');

    try {
      final response = await _api.get("${AppLink.getMyPosts}", token: token);

      if (response["status"] != "success") {
        throw NetworkExceptions.defaultError(
          response["message"] ?? "فشل جلب البيانات.",
        );
      }

      final List<SubjectGuidensModel> list = (response["data"] as List)
          .map((item) => SubjectGuidensModel.fromJson(item))
          .toList();

      return list;
    } catch (error) {
      final exception = NetworkExceptions.getException(error);
      final message = NetworkExceptions.getErrorMessage(exception);
      throw NetworkExceptions.defaultError(message);
    }
  }
}
