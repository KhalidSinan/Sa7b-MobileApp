import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sa7b/app/features/profile/data/repos/add_new_post_repo.dart';
import 'package:sa7b/app/features/profile/data/repos/edit_post_repo.dart';
import 'package:sa7b/app/features/profile/data/repos/edit_profile_repo.dart';
import 'package:sa7b/app/features/profile/data/repos/posts_list_repo.dart';
import 'package:sa7b/app/features/profile/data/sources/add_new_post_remote_data_source.dart';
import 'package:sa7b/app/features/profile/data/sources/edit_post_remote_data_source.dart';
import 'package:sa7b/app/features/profile/data/sources/edit_profile_remote_data_source.dart';
import 'package:sa7b/app/features/profile/data/sources/posts_list_remote_data_source.dart';
import 'package:sa7b/app/features/profile/logic/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/add_new_post_cubit.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/edit_post_cubit.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/post_by_id_cubit.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/posts_list_cubit.dart';
import 'package:sa7b/core/routing/app_router.dart';
import 'package:sa7b/core/services/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/features/profile/data/repos/profile_repo.dart';
import 'app/features/profile/data/sources/profile_remote_data_source.dart';
import 'app/features/profile/logic/cubit/profile/profile_cubit.dart';
import 'core/services/api_services_impl.dart';

abstract class AppConfig {
  AppConfig._();

  static final GetIt instance = GetIt.instance;

  // register singletons when the app launch
  static Future<void> configureApp() async {
    instance.registerLazySingleton(() => Dio());
    instance.registerLazySingleton(() => AppRouter());
    instance.registerLazySingleton(() => ApiServicesImpl());
    instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImp(internetConnectionChecker: instance()),
    );
    instance.registerLazySingleton(
      () => InternetConnectionChecker.createInstance(),
    );
    final sharedPreference = await SharedPreferences.getInstance();
    instance.registerLazySingleton(() => sharedPreference);

    //! feature - student_profile : edit profile - profile , post by id , posts
    //cubits
    instance.registerFactory<EditProfileCubit>(
      () => EditProfileCubit(instance()),
    );
    instance.registerFactory<ProfileCubit>(() => ProfileCubit(instance()));
    instance.registerFactory<PostByIdCubit>(() => PostByIdCubit(instance()));
    instance.registerFactory<PostsListCubit>(() => PostsListCubit(instance()));
    instance.registerFactory<AddNewPostCubit>(
      () => AddNewPostCubit(instance()),
    );
    instance.registerFactory<EditPostCubit>(() => EditPostCubit(instance()));

    //repos
    instance.registerLazySingleton<EditProfileRepo>(
      () => EditProfileRepo(
        editProfileRemoteDataSource: instance(),
        networkInfo: instance(),
      ),
    );
    instance.registerLazySingleton<ProfileRepo>(
      () => ProfileRepo(
        profileRemoteDataSource: instance(),
        networkInfo: instance(),
      ),
    );
    instance.registerLazySingleton<PostsListRepo>(
      () => PostsListRepo(
        postsListRemoteDataSource: instance(),
        networkInfo: instance(),
      ),
    );
    instance.registerLazySingleton<AddNewPostRepo>(
      () => AddNewPostRepo(
        addNewPostRemoteDataSource: instance(),
        networkInfo: instance(),
      ),
    );
    instance.registerLazySingleton<EditPostRepo>(
      () => EditPostRepo(
        editPostRemoteDataSource: instance(),
        networkInfo: instance(),
      ),
    );

    //data sources
    instance.registerLazySingleton<EditProfileRemoteDataSource>(
      () => EditProfileRemoteDataSourceImp(apiServicesImpl: instance()),
    );
    instance.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImp(apiServicesImpl: instance()),
    );
    instance.registerLazySingleton<PostsListRemoteDataSource>(
      () => PostsListRemoteDataSourceImp(apiServicesImpl: instance()),
    );
    instance.registerLazySingleton<AddNewPostRemoteDataSource>(
      () => AddNewPostRemoteDataSourceImp(apiServicesImpl: instance()),
    );
    instance.registerLazySingleton<EditPostRemoteDataSource>(
      () => EditPostRemoteDataSourceImp(apiServicesImpl: instance()),
    );
  }
}
