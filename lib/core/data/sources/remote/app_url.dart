// All Sa7b end-points URLs Put Here
// example => "/update-user-info", "/login"
abstract final class AppUrl {
  AppUrl._();

  static const String baseUrl = "http://10.0.2.2:8000/api";
  static const String editAccount = "/student/account/update";
  static const String account = "/student/account";
  static const String postById = "/student/posts";
}
