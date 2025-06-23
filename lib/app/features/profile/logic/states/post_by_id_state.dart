part of '../cubit/posts/post_by_id_cubit.dart';

@freezed
class PostByIdState<T> with _$PostByIdState {
  const factory PostByIdState.initial() = _Initial;
  const factory PostByIdState.loading() = Loading;
  const factory PostByIdState.success(PostByIdResponse postByIdResponse) =
      Success<T>;
  const factory PostByIdState.error({required String error}) = Error;
}
