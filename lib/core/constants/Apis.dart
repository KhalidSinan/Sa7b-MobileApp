class AppLink {
  static const String server = "https://saheb.medlifesy.org/public/api";
  static const String images = "https://saheb.medlifesy.org/public";

  static const String test = "$server/test.php";
  //////////////////Auth///////////////////
  static const String askotp = "$server/register/otp";
  static const String login = "$server/login";
  static const String verifyOtp = "$server/register/verify";
  static const String register = "$server/register/complete";

  ///////////////Admin APIs////////////////
  static const String getCourseGuidance =
      "$server/student/academic-guidance/course";
      static const String addVote =
      "$server/student/academic-guidance";
        static const String getMyPosts =
      "$server/student/academic-guidance";
       static const String updatreGuidance =
      "$server/student/academic-guidance";


      
}
