part of '../cubit/profile/profile_cubit.dart';

@freezed
class ProfileState<T> with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = Loading;
  const factory ProfileState.success(ProfileResponse profileResponse) =
      Success<T>;
  const factory ProfileState.error({required String error}) = Error;
}
