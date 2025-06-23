import 'package:dio/dio.dart';
import 'package:sa7b/app/features/profile/data/models/posts/add_post/add_new_post_response.dart';
import 'package:sa7b/core/data/sources/remote/app_url.dart';

import '../../../../../core/services/api_services_impl.dart';
import '../models/posts/add_post/add_new_post_request_body.dart';

abstract class AddNewPostRemoteDataSource {
  Future<AddNewPostResponse> addNewPost(
    AddNewPostRequestBody addNewPostRequestBody,
  );
}

class AddNewPostRemoteDataSourceImp implements AddNewPostRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  AddNewPostRemoteDataSourceImp({required this.apiServicesImpl});

  @override
  Future<AddNewPostResponse> addNewPost(
    AddNewPostRequestBody addNewPostRequestBody,
  ) async {
    final formMap = <String, dynamic>{
      'title': addNewPostRequestBody.title,
      'description': addNewPostRequestBody.description,
      'visibility': addNewPostRequestBody.visibility,
    };
    if (addNewPostRequestBody.files != null &&
        addNewPostRequestBody.files!.isNotEmpty) {
      for (int i = 0; i < addNewPostRequestBody.files!.length; i++) {
        final file = addNewPostRequestBody.files![i];
        formMap['files[$i]'] = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        );
      }
    }

    final formData = FormData.fromMap(formMap);

    try {
      final result = await apiServicesImpl.post(
        AppUrl.postById,
        formData: formData,
      );

      if (result is List) {
        final responses = AddNewPostResponse.fromJsonList(result);
        if (responses.isNotEmpty) {
          return responses.first;
        } else {
          throw Exception('Empty response list');
        }
      } else if (result is Map<String, dynamic>) {
        return AddNewPostResponse.fromJson(result);
      } else {
        throw Exception('Invalid response format');
      }
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}
