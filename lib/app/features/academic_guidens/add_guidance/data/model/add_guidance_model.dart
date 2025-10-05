class AcademicGuidanceModel {
  final int courseId;
  final String content;
  final String type;
  final String title;
  final List<String> links; // بدل link واحد

  AcademicGuidanceModel({
    required this.courseId,
    required this.content,
    required this.type,
    required this.title,
    required this.links,
  });

  Map<String, dynamic> toJson() {
    return {
      'course_id': courseId,
      'content': content,
      'type': type,
      'title': title,
      'links': links, // ابعت المصفوفة كاملة
    };
  }
}
