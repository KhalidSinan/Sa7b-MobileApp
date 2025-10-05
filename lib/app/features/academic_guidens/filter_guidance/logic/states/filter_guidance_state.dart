
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/model/subject_guidens_model.dart';

abstract class DateFilterState {}

class DateFilterInitial extends DateFilterState {}

class DateFilterLoading extends DateFilterState {}

class DateFilterLoaded extends DateFilterState {
  final List<CourseGuidanceModel> posts;
  DateFilterLoaded(this.posts);
}

class DateFilterError extends DateFilterState {
  final String message;
  DateFilterError(this.message);
}
