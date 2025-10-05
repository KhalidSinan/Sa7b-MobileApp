import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/academic_guidens/my_gudidance/data/sources/my_gudidance_service.dart';
import 'package:sa7b/app/features/academic_guidens/my_gudidance/logic/states/my_gudidance_state.dart';

class MyPostsCubit extends Cubit<MyPostsState> {
  final MyPostsRemoteDatasource service;

  MyPostsCubit(this.service) : super(MyPostsInitial());

  void fetchMyPosts() async {
    emit(MyPostsLoading());
    try {
      final posts = await service.getMyPosts();
      emit(MyPostsLoaded(posts));
    } catch (e) {
      emit(MyPostsError(e.toString()));
    }
  }
}
