import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './pages/home_page.dart';
import './core/app_theme.dart';
import './repositories/expense_repository.dart';
import 'blocs/expense_form/expense_form_bloc.dart';

class App extends StatelessWidget {
  const App({super.key, required this.expenseRepository});

  final ExpenseRepository expenseRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: expenseRepository,
      child: BlocProvider(
        create: (context) => ExpenseFormBloc(
          repository: expenseRepository,
        ),
        child: MaterialApp(
          home: const HomePage(),
          theme: AppTheme.lightAppTheme,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
