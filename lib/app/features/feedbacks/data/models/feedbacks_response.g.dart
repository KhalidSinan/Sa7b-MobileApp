// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedbacks_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackResponse _$FeedbackResponseFromJson(Map<String, dynamic> json) =>
    FeedbackResponse(
      success: json['success'] as bool,
      status: (json['status'] as num).toInt(),
      message: json['message'] as String,
      data:
          (json['data'] as List<dynamic>)
              .map((e) => FeedbackData.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$FeedbackResponseToJson(FeedbackResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

FeedbackData _$FeedbackDataFromJson(Map<String, dynamic> json) => FeedbackData(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  date: json['date'] as String,
  type: json['type'] as String,
  status: json['status'] as String,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
  author:
      json['author'] == null
          ? null
          : Author.fromJson(json['author'] as Map<String, dynamic>),
  course: Course.fromJson(json['course'] as Map<String, dynamic>),
  questions:
      (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$FeedbackDataToJson(FeedbackData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date,
      'type': instance.type,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'author': instance.author?.toJson(),
      'course': instance.course.toJson(),
      'questions': instance.questions.map((e) => e.toJson()).toList(),
    };

Author _$AuthorFromJson(Map<String, dynamic> json) => Author(
  id: (json['id'] as num).toInt(),
  username: json['username'] as String,
  email: json['email'] as String,
  emailVerifiedAt: json['email_verified_at'] as String?,
  role: json['role'] as String,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'email': instance.email,
  'email_verified_at': instance.emailVerifiedAt,
  'role': instance.role,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  collegeId: (json['college_id'] as num).toInt(),
  semesterId: (json['semester_id'] as num).toInt(),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'college_id': instance.collegeId,
  'semester_id': instance.semesterId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
  id: (json['id'] as num).toInt(),
  questionText: json['question_text'] as String,
  studentId: (json['student_id'] as num).toInt(),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
  'id': instance.id,
  'question_text': instance.questionText,
  'student_id': instance.studentId,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
