// import 'package:dartz/dartz.dart';
// import 'package:doctor_app/core/networking/error/exceptions.dart';
// import 'package:doctor_app/core/networking/error/failure.dart';
// import 'package:doctor_app/core/networking/network_info.dart';
// import 'package:doctor_app/features/login/data/datasources/login_remote_data_source.dart';
// import 'package:doctor_app/features/login/data/models/login_request_body.dart';

// import '../models/login_response.dart';

// class LoginRepo {
//   final LoginRemoteDataSource loginRemoteDataSource;
//   final NetworkInfo networkInfo;
//   LoginRepo({
//     required this.loginRemoteDataSource,
//     required this.networkInfo,
//   });

//   Future<Either<Failure, LoginResponse>> login(LoginRequestBody login) async {
//     final LoginRequestBody loginModel = LoginRequestBody(
//       email: login.email,
//       password: login.password,
//     );
//     if (await networkInfo.isConnected) {
//       try {
//         final loginResponse = await loginRemoteDataSource.login(loginModel);
//         return Right(loginResponse);
//       } on ServerException {
//         return Left(ServerFailure());
//       }
//     } else {
//       return Left(OfflineFailure());
//     }
//   }
// }
