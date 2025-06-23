part of '../cubit/posts/edit_post_cubit.dart';

@freezed
class EditPostState<T> with _$EditPostState {
  const factory EditPostState.initial() = _Initial;
  const factory EditPostState.loading() = Loading;
  const factory EditPostState.success(AddNewPostResponse editPostResponse) =
      Success<T>;
  const factory EditPostState.error({required String error}) = Error;
  const factory EditPostState.initialized() = Initialized;
  const factory EditPostState.imagePicked() = ImagePicked;
  const factory EditPostState.videoPicked() = VideoPicked;
  const factory EditPostState.pdfPicked() = PdfPicked;
  const factory EditPostState.mediaCleared() = MediaCleared;
}
