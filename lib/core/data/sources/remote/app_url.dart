// All Sa7b end-points URLs Put Here
// example => "/update-user-info", "/login"
abstract final class AppUrl {
  AppUrl._();

  static const String baseUrl = "https://saheb.medlifesy.org/public/api";
  static const String editAccount = "/student/account/update";
  static const String account = "/student/account";
  static const String postById = "/student/posts";
  static const String certificates = "/student/certificates";
  static const String addComplaint = "/student/complaints/send";
  static const String followers = "/student/followers";
  static const String following = "$followers/following";
  static const String feedbacks = "/student/feedbacks";
  static const String submitFeedbacks = "submit";
}
  