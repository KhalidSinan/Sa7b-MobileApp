import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/model/post_student_model.dart';
import 'package:sa7b/app/features/academic_guidens/subject_gudidance/data/model/vote_model.dart';

class CourseGuidanceModel {
  final int id;
  final int studentId;
  final int courseId;
  final String content;
  final String title;
  final String type;
  final int voteCount;
  final List<String> links;
  final CourseModel? course;  // nested object
  final List<VoteModel> votes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final PostStudentModel? student; // لو موجود عندك

  CourseGuidanceModel({
    required this.id,
    required this.studentId,
    required this.courseId,
    required this.content,
    required this.title,
    required this.type,
    required this.voteCount,
    this.links = const [],
    this.course,
    this.votes = const [],
    required this.createdAt,
    required this.updatedAt,
    this.student,
  });

  factory CourseGuidanceModel.fromJson(Map<String, dynamic> json) {
    return CourseGuidanceModel(
      id: json['id'],
      studentId: json['student_id'],
      courseId: json['course_id'],
      content: json['content'] ?? '',
      title: json['title'] ?? '',
      type: json['type'] ?? '',
      voteCount: json['vote_count'] ?? 0,
      links: json['links'] != null
          ? List<String>.from(json['links'])
          : [],
      course: json['course'] != null
          ? CourseModel.fromJson(json['course'])
          : null,
      votes: json['votes'] != null
          ? List<VoteModel>.from(
              json['votes'].map((x) => VoteModel.fromJson(x)))
          : [],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      student: json['student'] != null
          ? PostStudentModel.fromJson(json['student'])
          : null,
    );
  }
}

class CourseModel {
  final int id;
  final String name;
  final int collegeId;
  final int semesterId;

  CourseModel({
    required this.id,
    required this.name,
    required this.collegeId,
    required this.semesterId,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      name: json['name'] ?? '',
      collegeId: json['college_id'] ?? 0,
      semesterId: json['semester_id'] ?? 0,
    );
  }
}