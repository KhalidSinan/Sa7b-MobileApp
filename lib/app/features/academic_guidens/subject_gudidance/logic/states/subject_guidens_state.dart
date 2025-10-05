import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/model/subject_guidens_model.dart';


abstract class CourseGuidanceState {}

class CourseGuidanceInitial extends CourseGuidanceState {}

class CourseGuidanceLoading extends CourseGuidanceState {}

class CourseGuidanceLoaded extends CourseGuidanceState {
  final List<SubjectGuidensModel> posts;
  CourseGuidanceLoaded(this.posts);
}

class CourseGuidanceError extends CourseGuidanceState {
  final String message;
  CourseGuidanceError(this.message);
}
