import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sa7b/app/features/profile/data/models/posts/delete_post/delete_post_response.dart';
import 'package:sa7b/app/features/profile/data/models/posts/posts_list_response.dart';
import 'package:sa7b/app/features/profile/data/repos/posts_list_repo.dart';

part '../../states/posts_list_state.dart';
part 'posts_list_cubit.freezed.dart';

class PostsListCubit extends Cubit<PostsListState> {
  final PostsListRepo _postsListRepo;
  PostsListCubit(this._postsListRepo) : super(PostsListState.initial());

  void posts() async {
    emit(PostsListState.loading());
    try {
      final posts = await _postsListRepo.posts();
      emit(PostsListState.success(posts));
    } catch (e) {
      emit(PostsListState.error(error: e.toString()));
    }
  }

  Map<String, dynamic> getAttachmentInfo(
    PostsListResponse response,
    int index,
  ) {
    final filePath =
        response.data[index].files.isNotEmpty
            ? response.data[index].files.last.file
            : 'no Attachment';

    // final filePath =
    //     AppImages.defaultProfileImage;

    if (filePath.isEmpty) {
      return {'type': AttachmentType.none, 'path': null};
    }

    final extension = filePath.split('.').last.toLowerCase();

    return {'type': _determineAttachmentType(extension), 'path': filePath};
  }

  AttachmentType _determineAttachmentType(String extension) {
    if (['jpg', 'jpeg', 'png', 'gif'].contains(extension)) {
      return AttachmentType.image;
    } else if (['mp4', 'mov', 'avi'].contains(extension)) {
      return AttachmentType.video;
    } else {
      return AttachmentType.file;
    }
  }

  Future<void> deletePost(int id) async {
    emit(PostsListState.loading());
    try {
      final deletePosts = await _postsListRepo.deletePost(id);
      emit(PostsListState.deleted(deletePosts));
    } catch (e) {
      emit(
        PostsListState.error(
          error: "You are not authorized to delete this post.",
        ),
      );
    }
  }

  bool isImage(String url) {
    final lower = url.toLowerCase();
    return lower.endsWith(".jpg") ||
        lower.endsWith(".jpeg") ||
        lower.endsWith(".png") ||
        lower.endsWith(".gif");
  }

  bool isVideo(String url) {
    final lower = url.toLowerCase();
    return lower.endsWith(".mp4") ||
        lower.endsWith(".mov") ||
        lower.endsWith(".avi") ||
        lower.endsWith(".mkv");
  }
}
