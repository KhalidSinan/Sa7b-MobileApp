import 'package:flutter/material.dart';
import 'package:sa7b/app/features/profile/ui/add_post_or_certificate_screen.dart';
import 'package:sa7b/app/features/profile/ui/edit_profile_screen.dart';
import 'package:sa7b/app/features/profile/ui/posts_or_certificates_screen.dart';
import 'package:sa7b/app/features/profile/ui/profile_screen.dart';
import 'package:sa7b/core/constants/app_strings.dart';

import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.editProfile:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      case Routes.profile:
        final args = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder:
              (_) => ProfileScreen(
                isOwner: args?['isOwner'] ?? false,
              ), //! shoule be false as default
        );
      case Routes.postsOrCertificates:
        final args = settings.arguments as Map<String, dynamic>?;
        final contentType = args?['contentType'] ?? AppStrings.posts;
        final isOwner = args?['isOwner'] ?? false;
        return MaterialPageRoute(
          builder:
              (_) => PostsOrCertificatesScreen(
                contentType: contentType,
                isOwner: isOwner,
              ),
        );
      case Routes.addPostOrCertificate:
        final args = settings.arguments as Map<String, dynamic>?;
        final contentType = args?['contentType'] ?? AppStrings.addPost;
        return MaterialPageRoute(
          builder: (_) => AddPostOrCertificateScreen(contentType: contentType),
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
