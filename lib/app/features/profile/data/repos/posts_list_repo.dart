import 'package:sa7b/app/features/profile/data/models/posts/delete_post/delete_post_response.dart';
import 'package:sa7b/app/features/profile/data/models/posts/posts_list_response.dart';
import 'package:sa7b/app/features/profile/data/sources/posts_list_remote_data_source.dart';

import '../../../../../core/services/network_info.dart';

class PostsListRepo {
  final PostsListRemoteDataSource postsListRemoteDataSource;
  final NetworkInfo networkInfo;

  PostsListRepo({
    required this.postsListRemoteDataSource,
    required this.networkInfo,
  });

  Future<PostsListResponse> posts() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await postsListRemoteDataSource.posts();
        return response;
      } catch (e) {
        throw Exception('Failed to get Posts: $e');
      }
    } else {
      throw Exception('No Internet Connection');
    }
  }

  Future<DeletePostResponse> deletePost(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await postsListRemoteDataSource.deletePost(id);
        return response;
      } catch (e) {
        throw Exception('Failed to Delete Post: $e');
      }
    } else {
      throw Exception('No Internet Connection');
    }
  }

  
}
