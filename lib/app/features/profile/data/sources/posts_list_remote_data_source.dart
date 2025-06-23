import 'package:dio/dio.dart';
import 'package:sa7b/app/features/profile/data/models/posts/delete_post/delete_post_response.dart';
import 'package:sa7b/app/features/profile/data/models/posts/posts_list_response.dart';
import 'package:sa7b/core/data/sources/remote/app_url.dart';

import '../../../../../core/services/api_services_impl.dart';

abstract class PostsListRemoteDataSource {
  Future<PostsListResponse> posts();
  Future<DeletePostResponse> deletePost(int id);
}

class PostsListRemoteDataSourceImp implements PostsListRemoteDataSource {
  final ApiServicesImpl apiServicesImpl;

  PostsListRemoteDataSourceImp({required this.apiServicesImpl});

  @override
  Future<PostsListResponse> posts() async {
    try {
      final posts = await apiServicesImpl.get(
        AppUrl.postById,
      );
      return PostsListResponse.fromJson(posts);
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<DeletePostResponse> deletePost(int id) async {
    try {
      final response = await apiServicesImpl.delete(
        '${AppUrl.postById}/$id',
      );
      return DeletePostResponse.fromJson(response);
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }
}
