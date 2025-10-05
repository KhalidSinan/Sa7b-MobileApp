class UpdateGuidanceModel {
  final int id;
  final String title;
  final String content;
  final String type;

  UpdateGuidanceModel({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'content': content,
        'type': type,
      };
}
