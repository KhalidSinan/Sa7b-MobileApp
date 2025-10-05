import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/model/subject_guidens_model.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/sources/subject_guidens_service.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/logic/states/subject_guidens_state.dart';

class CourseGuidanceCubit extends Cubit<CourseGuidanceState> {
  final AcademicGuidanceRemoteDatasource datasource;

  List<SubjectGuidensModel> allPosts = []; // نخزن كل البوستات

  CourseGuidanceCubit(this.datasource) : super(CourseGuidanceInitial());

  Future<void> fetchCourseGuidance(int courseId) async {
    try {
      emit(CourseGuidanceLoading());
      final posts = await datasource.getCourseGuidance(courseId);
      allPosts = posts; // نخزن النسخة الكاملة
      emit(CourseGuidanceLoaded(posts));
    } catch (error) {
      emit(CourseGuidanceError(error.toString()));
    }
  }

  void filterByDate(DateTime start, DateTime end) {
    final filtered = allPosts.where((post) {
      final createdAt =
          DateTime.parse(post.createdAt.toIso8601String()); // لازم يكون عندك createdAt
      return createdAt.isAfter(start) && createdAt.isBefore(end);
    }).toList();

    emit(CourseGuidanceLoaded(filtered));
  }
}
