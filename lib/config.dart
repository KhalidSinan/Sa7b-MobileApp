import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sa7b/app/features/auth/verification/data/sources/verification_data_Sources.dart';
import 'package:sa7b/core/routing/app_router.dart';
import 'package:sa7b/core/services/api_services.dart';
import 'package:sa7b/core/services/api_services_impl.dart';

abstract class AppConfig {
  AppConfig._();

  static final GetIt _instance = GetIt.instance;

  // register singletons when the app launch
  static Future<void> configureApp() async {
    _instance.registerLazySingleton(() => Dio());
    _instance.registerLazySingleton(() => AppRouter());

    // 👇 سجل ApiServices
    _instance.registerLazySingleton<ApiServices>(() => ApiServicesImpl());
    _instance.registerLazySingleton<VerificationDataSources>(() => VerificationRemoteDataSourceImpl());


    // // 👇 سجل AuthRemoteDataSource إذا بدك تمرره من GetIt
    // _instance.registerLazySingleton<AuthRemoteDataSource>(
    //   () => AuthRemoteDataSourceImpl(),
    // );
  }
}
