import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sa7b/core/utils/imports_manager.dart';
import 'package:sa7b/features/send_complaint/ui/send_complaint_screen.dart';
import 'package:sa7b/features/speak_up/speak_up_screen.dart';
import 'package:sa7b/features/feedbacks/ui/feedbacks_screen.dart';

class Sa7bApp extends StatelessWidget {
  const Sa7bApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        title: 'Sa7b',
        theme: AppTheme.theme,
        debugShowCheckedModeBanner: false,
        routes: {
          '/sendComplaintScreen': (context) => SendComplaintScreen(),
          '/feedbacksScreen' : (context) => FeedbacksScreen(),
        },
        // home: Scaffold(body: Center(child: Text("Sa7b Application"))),
        home: SpeakUpScreen(),
      ),
    );
  }
}
