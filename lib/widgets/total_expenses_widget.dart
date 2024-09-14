import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/expense_list/expense_list_bloc.dart';
import '../utils/format_total_expenses.dart';

class TotalExpenseWidget extends StatelessWidget {
  const TotalExpenseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final state = context.watch<ExpenseListBloc>().state;

    final totalExpenses = formatTotalExpenses(state.totalExpense);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Expenses',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onBackground.withOpacity(0.4),
            ),
          ),
          Text(totalExpenses, style: textTheme.displaySmall),
        ],
      ),
    );
  }
}