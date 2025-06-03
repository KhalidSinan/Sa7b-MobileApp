import 'package:flutter/material.dart';
import 'package:sa7b/features/profile/presentation/screens/edit_profile_screen.dart';

import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.editProfile:
        return MaterialPageRoute(
          builder: (_) => EditProfileScreen(),
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
