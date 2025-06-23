import '../../../../../core/services/network_info.dart';
import '../models/posts/add_post/add_new_post_request_body.dart';
import '../models/posts/add_post/add_new_post_response.dart';
import '../sources/edit_post_remote_data_source.dart';

class EditPostRepo {
  final EditPostRemoteDataSource editPostRemoteDataSource;
  final NetworkInfo networkInfo;

  EditPostRepo({
    required this.editPostRemoteDataSource,
    required this.networkInfo,
  });

  Future<AddNewPostResponse> editPost(
    int id,
    AddNewPostRequestBody editPost,
  ) async {
    final AddNewPostRequestBody edit = AddNewPostRequestBody(
      title: editPost.title,
      description: editPost.description,
      visibility: editPost.visibility,
      files: editPost.files,
    );

    if (await networkInfo.isConnected) {
      try {
        final response = await editPostRemoteDataSource.editPost(id, edit);
        return response;
      } catch (e) {
        throw Exception('Failed to Edit Post: $e');
      }
    } else {
      throw Exception('No Internet Connection');
    }
  }
}
