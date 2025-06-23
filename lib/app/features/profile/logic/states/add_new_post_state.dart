part of '../cubit/posts/add_new_post_cubit.dart';

@freezed
class AddNewPostState<T> with _$AddNewPostState {
  const factory AddNewPostState.initial() = _Initial;
  const factory AddNewPostState.loading() = Loading;
  const factory AddNewPostState.success(AddNewPostResponse addNewPostResponse) =
      Success<T>;
  const factory AddNewPostState.error({required String error}) = Error;
  const factory AddNewPostState.imagePicked() = ImagePicked;
  const factory AddNewPostState.videoPicked() = VideoPicked;
  const factory AddNewPostState.pdfPicked() = PdfPicked;
  const factory AddNewPostState.mediaCleared() = MediaCleared;
}
