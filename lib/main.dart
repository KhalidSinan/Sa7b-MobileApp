import 'package:flutter/material.dart';
import 'package:sa7b/app.dart';
import 'package:sa7b/config.dart';

void main() async {
  await AppConfig.configureApp();
  runApp(Sa7bApp());
}
