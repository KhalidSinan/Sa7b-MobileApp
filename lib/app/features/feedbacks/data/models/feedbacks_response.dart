import 'package:json_annotation/json_annotation.dart';

part 'feedbacks_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FeedbackResponse {
  final bool success;

  final int status;

  final String message;

  final List<FeedbackData> data;

  FeedbackResponse({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory FeedbackResponse.fromJson(Map<String, dynamic> json) =>
      _$FeedbackResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FeedbackData {
  final int id;

  final String title;

  final String date;

  final String type;

  final String status;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  final Author? author;

  final Course course;

  final List<Question> questions;

  FeedbackData({
    required this.id,
    required this.title,
    required this.date,
    required this.type,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.author,
    required this.course,
    required this.questions,
  });

  factory FeedbackData.fromJson(Map<String, dynamic> json) =>
      _$FeedbackDataFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackDataToJson(this);
}

@JsonSerializable()
class Author {
  final int id;

  final String username;

  final String email;

  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;

  final String role;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  Author({
    required this.id,
    required this.username,
    required this.email,
    this.emailVerifiedAt,
    required this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

@JsonSerializable()
class Course {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'college_id')
  final int collegeId;

  @JsonKey(name: 'semester_id')
  final int semesterId;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  Course({
    required this.id,
    required this.name,
    required this.collegeId,
    required this.semesterId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable()
class Question {
  final int id;

  @JsonKey(name: 'question_text')
  final String questionText;

  @JsonKey(name: 'student_id')
  final int studentId;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  Question({
    required this.id,
    required this.questionText,
    required this.studentId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
