part of '../cubit/edit_profile/edit_profile_cubit.dart';

@freezed
class EditProfileState<T> with _$EditProfileState<T> {
  const factory EditProfileState.initial() = _Initial;
  const factory EditProfileState.loading() = Loading;
  const factory EditProfileState.success(T data) = Success<T>;
  const factory EditProfileState.error({required String error}) = Error;
  const factory EditProfileState.imagePicked(File? imageFile) = ImagePicked;
}
