import 'package:flutter/material.dart';
import 'package:sa7b/core/utils/imports_manager.dart';

class Sa7bApp extends StatelessWidget {
  const Sa7bApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sa7b',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text("Sa7b Application"))),
    );
  }
}
