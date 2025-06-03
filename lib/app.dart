import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/routing/app_router.dart';
import 'package:sa7b/core/routing/routes.dart';
import 'package:sa7b/core/utils/imports_manager.dart';


class Sa7bApp extends StatelessWidget {
  final AppRouter appRouter;

  const Sa7bApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Sa7b',
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.editProfile,
      ),
    );
  }
}
