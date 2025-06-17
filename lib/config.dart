import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sa7b/core/routing/app_router.dart';

abstract class AppConfig {
  AppConfig._();

  static final GetIt _instance = GetIt.instance;

  // register singletons when the app launch
  static Future<void> configureApp() async {
    _instance.registerLazySingleton(() => Dio());
    _instance.registerLazySingleton(() => AppRouter());
  }
}
