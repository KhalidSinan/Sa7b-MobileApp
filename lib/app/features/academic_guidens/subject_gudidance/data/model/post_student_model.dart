class PostStudentModel {
  final int id;
  final String firstName;
  final String? middleName;
  final String lastName;
  final String? bio;
  final String phoneNumber;
  final String image;
  final String? linkedIn;
  final String? facebook;
  final String? github;
  final String? x;
  final int userId;
  final int collegeId;
  final DateTime createdAt;
  final DateTime updatedAt;

  PostStudentModel({
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.bio,
    required this.phoneNumber,
    required this.image,
    required this.linkedIn,
    required this.facebook,
    required this.github,
    required this.x,
    required this.userId,
    required this.collegeId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PostStudentModel.fromJson(Map<String, dynamic> json) {
    return PostStudentModel(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? "",
      middleName: json['middle_name'],
      lastName: json['last_name'] ?? "",
      bio: json['bio'],
      phoneNumber: json['phone_number'] ?? "",
      image: json['image'] ?? "",
      linkedIn: json['linkedIn_account'],
      facebook: json['facebook_account'],
      github: json['github_account'],
      x: json['x_account'],
      userId: json['user_id'] ?? 0,
      collegeId: json['college_id'] ?? 0,
      createdAt: DateTime.tryParse(json['created_at'] ?? "") ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? "") ?? DateTime.now(),
    );
  }

  String? get fullName {
    final name = "$firstName ${middleName ?? ""} $lastName".trim();
    return name.isNotEmpty ? name : "أنا"; // إذا الاسم كله فاضي، يرجع "أنا"
  }
}
