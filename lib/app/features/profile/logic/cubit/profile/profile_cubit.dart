import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sa7b/app/features/profile/data/models/profile/profile_response.dart';


import '../../../data/repos/profile_repo.dart';


part '../../states/profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(ProfileState.initial());

  void profileInfo() async {
    emit(ProfileState.loading());
    try {
      final response = await _profileRepo.profile();
      emit(ProfileState.success(response));
    } catch (e) {
      emit(ProfileState.error(error: e.toString()));
    }
  }
}
