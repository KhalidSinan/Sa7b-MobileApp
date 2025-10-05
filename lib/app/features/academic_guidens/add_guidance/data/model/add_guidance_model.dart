class AcademicGuidanceModel {
  final int courseId;
  final String content;
  final String type;
  final String title;
  final String link;

  AcademicGuidanceModel(
    {
    required this.courseId,
    required this.content,
    required this.type,
    required this.title,
    required this.link
  });

  Map<String, dynamic> toJson() {
    return {
      'course_id': courseId,
      'content': content,
      'type': type,
      'title': title,
      'links[0]': link,
    };
  }
}
