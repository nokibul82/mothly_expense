import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

import './core/app_color.dart';
import './data/local_data_storage.dart';
import './repositories/expense_repository.dart';
import './app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColor.background,
      systemStatusBarContrastEnforced: true));
  final storage =
      LocalDataStorage(preferences: await SharedPreferences.getInstance());
  final expenseRepository = ExpenseRepository(storage: storage);
  runApp(App(expenseRepository: expenseRepository));
}
