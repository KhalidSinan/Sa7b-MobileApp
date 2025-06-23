import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app/features/profile/data/models/posts/edit_post_args.dart';
import 'package:sa7b/app/features/profile/logic/cubit/edit_profile/edit_profile_cubit.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/add_new_post_cubit.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/edit_post_cubit.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/post_by_id_cubit.dart';
import 'package:sa7b/app/features/profile/logic/cubit/posts/posts_list_cubit.dart';
import 'package:sa7b/app/features/profile/logic/cubit/profile/profile_cubit.dart';
import 'package:sa7b/app/features/profile/ui/add_post_or_certificate_screen.dart';
import 'package:sa7b/app/features/profile/ui/edit_post_screen.dart';
import 'package:sa7b/app/features/profile/ui/edit_profile_screen.dart';
import 'package:sa7b/app/features/profile/ui/posts_or_certificates_screen.dart';
import 'package:sa7b/app/features/profile/ui/profile_screen.dart';
import 'package:sa7b/core/constants/app_strings.dart';

import '../../config.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.editProfile:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => AppConfig.instance<EditProfileCubit>(),
                child: const EditProfileScreen(),
              ),
        );
      case Routes.profile:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create:
                        (_) =>
                            AppConfig.instance<ProfileCubit>()..profileInfo(),
                  ),
                  BlocProvider(
                    create:
                        (_) => AppConfig.instance<PostByIdCubit>()..postById(),
                  ),
                ],
                child: ProfileScreen(isOwner: args?['isOwner'] ?? true),
              ), //! shoule be false as default
        );
      case Routes.postsOrCertificates:
        final args = settings.arguments as Map<String, dynamic>?;
        final contentType = args?['contentType'] ?? AppStrings.posts;
        final isOwner = args?['isOwner'] ?? true;
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) => AppConfig.instance<PostsListCubit>()..posts(),
                child: PostsOrCertificatesScreen(
                  contentType: contentType,
                  isOwner: isOwner,
                ),
              ),
        );
      case Routes.addPostOrCertificate:
        final args = settings.arguments as Map<String, dynamic>?;
        final contentType = args?['contentType'] ?? AppStrings.addPost;
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider<AddNewPostCubit>(
                    create: (context) => AppConfig.instance<AddNewPostCubit>(),
                  ),
                  BlocProvider<EditPostCubit>(
                    create: (context) => AppConfig.instance<EditPostCubit>(),
                  ),
                ],
                child: AddPostOrCertificateScreen(contentType: contentType),
              ),
        );
      case Routes.editPost:
        final args = settings.arguments as EditPostArgs;
        return MaterialPageRoute(
          builder:
              (_) => MultiBlocProvider(
                providers: [
                  BlocProvider<AddNewPostCubit>(
                    create: (context) => AppConfig.instance<AddNewPostCubit>(),
                  ),
                  BlocProvider<EditPostCubit>(
                    create: (context) {
                      AppConfig.instance<EditPostCubit>();
                      final cubit = AppConfig.instance<EditPostCubit>();
                      cubit.initializePostData(
                        title: args.title,
                        visibility: args.visibility,
                        description: args.description,
                        imageFile: args.imageFile,
                        videoFile: args.videoFile,
                        pdf: args.pdfFile,
                      );
                      return cubit;
                    },
                  ),
                ],
                child: EditPostScreen(args: args),
              ),
        );
      // case Routes.loginScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<LoginCubit>(),
      //       child: const LoginScreen(),
      //     ),
      //   );
      // case Routes.homeScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider(
      //       create: (context) => getIt<HomeCubit>()..sspecializationData(),
      //       child: HomeScreen(),
      //     ),
      //   );
      default:
        return null;
      //  MaterialPageRoute(
      //   builder: (_) => Scaffold(
      //     body: Center(
      //       child: Text('No Routes'),
      //     ),
      //   ),
      // );
    }
  }
}
