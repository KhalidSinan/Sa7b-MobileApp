// import 'package:doctor_app/core/helpers/app_shared_preferences.dart';
// import 'package:doctor_app/core/networking/app_link_url.dart';
// import 'package:doctor_app/core/networking/crud_dio.dart';
// import 'package:doctor_app/core/networking/error/exceptions.dart';
// import 'package:doctor_app/features/login/data/models/login_request_body.dart';
// import 'package:doctor_app/features/login/data/models/login_response.dart';

// import '../../../../core/constant/strings.dart';

// abstract class LoginRemoteDataSource {
//   Future<LoginResponse> login(LoginRequestBody login);
// }

// class LoginRemoteDataSourceImp implements LoginRemoteDataSource {
//   final CrudDio dio;

//   LoginRemoteDataSourceImp({required this.dio});

//   @override
//   Future<LoginResponse> login(LoginRequestBody login) async {
//     final result = await dio.dioPostMethod(
//       endPoint: AppLinkUrl.login,
//       data: {
//         'email': login.email,
//         'password': login.password,
//       },
//       token: '',
//       queryParameters: {},
//     );
//     // return Future.value(unit);
//     return result.fold(
//       (fail) => throw ServerException(),
//       (loginResponse) async {
//         final sharedPref = AppSharedPreferences();
//         final parsedResponse = LoginResponse.fromJson(loginResponse);
//         final token = parsedResponse.userData?.token;

//         if (token != null) {
//           await sharedPref.setString(authToken, token);
//         }

//         return parsedResponse;
//       },
//     );
//   }
// }
