import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:sa7b/core/routing/app_router.dart';
import 'package:sa7b/core/routing/routes.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class Sa7bApp extends StatelessWidget {
  const Sa7bApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = GetIt.I.get<AppRouter>();
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        locale: AppLocales.ar,
        supportedLocales: const [AppLocales.ar],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: 'Sa7b',
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        initialRoute: Routes.profile,
      ),
    );
  }
}
