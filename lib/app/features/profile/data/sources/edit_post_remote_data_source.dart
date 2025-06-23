import 'package:dio/dio.dart';

import '../../../../../core/data/sources/remote/app_url.dart';
import '../../../../../core/services/api_services_impl.dart';
import '../models/posts/add_post/add_new_post_request_body.dart';
import '../models/posts/add_post/add_new_post_response.dart';

abstract class EditPostRemoteDataSource {
  Future<AddNewPostResponse> editPost(int id, AddNewPostRequestBody editPost);
}

class EditPostRemoteDataSourceImp implements EditPostRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  EditPostRemoteDataSourceImp({required this.apiServicesImpl});

  @override
  Future<AddNewPostResponse> editPost(
    int id,
    AddNewPostRequestBody editPost,
  ) async {
    final formMap = <String, dynamic>{
      'title': editPost.title,
      'description': editPost.description,
      'visibility': editPost.visibility,
    };
    if (editPost.files != null && editPost.files!.isNotEmpty) {
      for (int i = 0; i < editPost.files!.length; i++) {
        final file = editPost.files![i];
        formMap['files[$i]'] = await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        );
      }
    }

    final formData = FormData.fromMap(formMap);

    try {
      final result = await apiServicesImpl.post(
        '${AppUrl.postById}/$id',
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
