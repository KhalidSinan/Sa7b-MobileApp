import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/model/subject_guidens_model.dart';

abstract class MyPostsState {}

class MyPostsInitial extends MyPostsState {}

class MyPostsLoading extends MyPostsState {}

class MyPostsLoaded extends MyPostsState {
  final List<CourseGuidanceModel> posts;
  MyPostsLoaded(this.posts);
}

class MyPostsError extends MyPostsState {
  final String message;
  MyPostsError(this.message);
}
