import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sa7b/app.dart';
import 'package:sa7b/config.dart';
import 'package:sa7b/core/functions/cubit_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig.configureApp();
  Bloc.observer = MyCubitObserver();

  runApp(Sa7bApp());
}
