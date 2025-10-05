class VoteModel {
  final int id;
  final int studentId;
  final int academicGuidanceId;
  final String type; // up / down
  final DateTime createdAt;
  final DateTime updatedAt;

  VoteModel({
    required this.id,
    required this.studentId,
    required this.academicGuidanceId,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VoteModel.fromJson(Map<String, dynamic> json) {
    return VoteModel(
      id: json['id'] ?? 0,
      studentId: json['student_id'] ?? 0,
      academicGuidanceId: json['academic_guidance_id'] ?? 0,
      type: json['type'] ?? "",
      createdAt: DateTime.tryParse(json['created_at'] ?? "") ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? "") ?? DateTime.now(),
    );
  }
}
