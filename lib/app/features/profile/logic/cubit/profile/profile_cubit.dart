import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sa7b/app/features/profile/data/models/follow/follow_and_unfollow_response.dart';
import 'package:sa7b/app/features/profile/data/models/profile/profile_response.dart';

import '../../../../../../core/domain/error_handler/network_exceptions.dart';
import '../../../data/repos/profile_repo.dart';

part '../../states/profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(ProfileState.initial());

  bool isFollowing = false;

  void profileInfo() async {
    emit(ProfileState.loading());
    try {
      final response = await _profileRepo.profile();
      emit(ProfileState.success(response));
    } catch (e, stackTrace) {
      print('Error: $e'); // طباعة الخطأ الفعلي
      print('StackTrace: $stackTrace');
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(ProfileState.error(error: message));
    }
  }

  Future<void> followUser(int userId) async {
    emit(ProfileState.loading());

    try {
      final response = await _profileRepo.followUser(userId);
      emit(ProfileState.followAndUnfollowSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(ProfileState.error(error: message));
    }
  }

  Future<void> unFollowUser(int userId) async {
    emit(ProfileState.loading());

    try {
      final response = await _profileRepo.unFollowUser(userId);
      emit(ProfileState.followAndUnfollowSuccess(response));
    } catch (e) {
      final exception = NetworkExceptions.getException(e);
      final message = NetworkExceptions.getErrorMessage(exception);
      emit(ProfileState.error(error: message));
    }
  }
}
