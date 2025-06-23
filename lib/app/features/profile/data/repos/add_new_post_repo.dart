import 'package:sa7b/app/features/profile/data/models/posts/add_post/add_new_post_request_body.dart';
import 'package:sa7b/app/features/profile/data/models/posts/add_post/add_new_post_response.dart';
import 'package:sa7b/app/features/profile/data/sources/add_new_post_remote_data_source.dart';
import 'package:sa7b/core/services/network_info.dart';

class AddNewPostRepo {
  final AddNewPostRemoteDataSource addNewPostRemoteDataSource;
  final NetworkInfo networkInfo;

  AddNewPostRepo({
    required this.addNewPostRemoteDataSource,
    required this.networkInfo,
  });

  Future<AddNewPostResponse> addNewPost(
    AddNewPostRequestBody addNewPost,
  ) async {
    final AddNewPostRequestBody addPost = AddNewPostRequestBody(
      title: addNewPost.title,
      description: addNewPost.description,
      visibility : addNewPost.visibility,
      files: addNewPost.files,
    );

    if (await networkInfo.isConnected) {
      try {
        final response = await addNewPostRemoteDataSource.addNewPost(
          addPost,
        );
        return response;
      } catch (e) {
        throw Exception('Failed to Add Post: $e');
      }
    } else {
      throw Exception('No Internet Connection');
    }
  }
}
