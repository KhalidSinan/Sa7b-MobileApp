import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sa7b/app/features/profile/data/models/posts/post_by_id_response.dart';


import '../../../data/repos/profile_repo.dart';

part '../../states/post_by_id_state.dart';
part 'post_by_id_cubit.freezed.dart';

class PostByIdCubit extends Cubit<PostByIdState> {
  final ProfileRepo _profileRepo;
  PostByIdCubit(this._profileRepo) : super(PostByIdState.initial());

  void postById() async {
    emit(PostByIdState.loading());
    try {
      final response = await _profileRepo.postById();
      emit(PostByIdState.success(response));
    } catch (e) {
      emit(PostByIdState.error(error: e.toString()));
    }
  }
}
