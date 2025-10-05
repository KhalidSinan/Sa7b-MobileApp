class StudentModel {
  final int id;
  final String firstName;
  final String? middleName;
  final String lastName;
  final String? bio;
  final String? phoneNumber;
  final String? image;
  final String? linkedInAccount;
  final String? facebookAccount;
  final String? githubAccount;
  final String? xAccount;
  final int userId;
  final int collegeId;
  final DateTime createdAt;
  final DateTime updatedAt;

  StudentModel({
    required this.id,
    required this.firstName,
    this.middleName,
    required this.lastName,
    this.bio,
    this.phoneNumber,
    this.image,
    this.linkedInAccount,
    this.facebookAccount,
    this.githubAccount,
    this.xAccount,
    required this.userId,
    required this.collegeId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      firstName: json['first_name'],
      middleName: json['middle_name'],
      lastName: json['last_name'],
      bio: json['bio'],
      phoneNumber: json['phone_number'],
      image: json['image'],
      linkedInAccount: json['linkedIn_account'],
      facebookAccount: json['facebook_account'],
      githubAccount: json['github_account'],
      xAccount: json['x_account'],
      userId: json['user_id'],
      collegeId: json['college_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'middle_name': middleName,
      'last_name': lastName,
      'bio': bio,
      'phone_number': phoneNumber,
      'image': image,
      'linkedIn_account': linkedInAccount,
      'facebook_account': facebookAccount,
      'github_account': githubAccount,
      'x_account': xAccount,
      'user_id': userId,
      'college_id': collegeId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
