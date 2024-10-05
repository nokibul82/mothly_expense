import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './data/local_data_storage.dart';
import './repositories/expense_repository.dart';
import './app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final storage =
      LocalDataStorage(preferences: await SharedPreferences.getInstance());
  final expenseRepository = ExpenseRepository(storage: storage);
  runApp(App(expenseRepository: expenseRepository));
}
