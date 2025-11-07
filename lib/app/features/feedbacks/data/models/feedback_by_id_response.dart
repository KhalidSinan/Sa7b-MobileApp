import 'package:json_annotation/json_annotation.dart';

part 'feedback_by_id_response.g.dart';

@JsonSerializable()
class FeedbackByIdResponse {
  final bool? success;
  final int? status;
  final String? message;
  final FeedbackData? data;

  const FeedbackByIdResponse({
    this.success,
    this.status,
    this.message,
    this.data,
  });

  factory FeedbackByIdResponse.fromJson(Map<String, dynamic> json) =>
      _$FeedbackByIdResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackByIdResponseToJson(this);
}

@JsonSerializable()
class FeedbackData {
  final int? id;
  final String? title;
  final String? date;
  final String? type;
  final String? status;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  final Author? author;
  final Course? course;

  @JsonKey(defaultValue: [])
  final List<Question>? questions;

  const FeedbackData({
    this.id,
    this.title,
    this.date,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.author,
    this.course,
    this.questions,
  });

  factory FeedbackData.fromJson(Map<String, dynamic> json) =>
      _$FeedbackDataFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackDataToJson(this);
}

@JsonSerializable()
class Author {
  final int? id;
  final String? username;
  final String? email;

  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;

  final String? role;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const Author({
    this.id,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}

@JsonSerializable()
class Course {
  final int? id;
  final String? name;

  @JsonKey(name: 'college_id')
  final int? collegeId;

  @JsonKey(name: 'semester_id')
  final int? semesterId;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const Course({
    this.id,
    this.name,
    this.collegeId,
    this.semesterId,
    this.createdAt,
    this.updatedAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}

@JsonSerializable()
class Question {
  final int? id;

  @JsonKey(name: 'question_text')
  final String? questionText;

  @JsonKey(name: 'student_id')
  final int? studentId;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  const Question({
    this.id,
    this.questionText,
    this.studentId,
    this.createdAt,
    this.updatedAt,
  });

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}