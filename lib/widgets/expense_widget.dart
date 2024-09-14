import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mothly_expense/blocs/expense_list/expense_list_bloc.dart';

import 'expense_tile_widget.dart';
import 'loading_widget.dart';

class ExpenseWidget extends StatelessWidget {
  const ExpenseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseListBloc, ExpenseListState>(
      builder: (context, state) {
        if (state.status == ExpenseListStatus.loading) {
          return const LoadingWidget(radius: 12, addPadding: true);
        }

        final expenses = state.expenses.toList();
        if( state.status == ExpenseListStatus.success && expenses.isEmpty){
          return const EmptyListWidget();
        }
        return ListView.separated(
            itemBuilder: (context, index) => ExpenseTileWidget(
              expense: expenses[index]!
            ),
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
            itemCount: expenses.length);
      },
    );
  }
}


class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Column(
        children: [
          const Icon(Icons.search),
          const SizedBox(height: 10),
          Text(
            'Nothing to see here',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
