part of '../cubit/posts/posts_list_cubit.dart';

@freezed
class PostsListState<T> with _$PostsListState {
  const factory PostsListState.initial() = _Initial;
  const factory PostsListState.loading() = Loading;
  const factory PostsListState.success(PostsListResponse postsListResponse) =
      Success<T>;
  const factory PostsListState.deleted(DeletePostResponse deletePostResponse) =
      Deleted;
  const factory PostsListState.error({required String error}) = Error;
}
