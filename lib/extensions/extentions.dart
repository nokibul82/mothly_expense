import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/expense_form/expense_form_bloc.dart';
import '../repositories/expense_repository.dart';
import '../widgets/add_expense_sheet_widget.dart';

extension AppX on BuildContext {
  Future<void> showAddExpenseSheet(){
    return showModalBottomSheet(
      context: this,
      showDragHandle: true,
      builder: (context) => BlocProvider(
        create: (context) => ExpenseFormBloc(
          repository: read<ExpenseRepository>(),
        ),
        child: const AddExpenseSheetWidget(),
      ),
    );
}
}