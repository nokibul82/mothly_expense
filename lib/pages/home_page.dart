import 'package:flutter/material.dart';
import '../extensions/extentions.dart';
import '../models/expense_model.dart';
import '../widgets/expense_filter_widget.dart';
import '../widgets/expense_widget.dart';
import '../widgets/total_expenses_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ExpenseModel? expense;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Monthly Expense"),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TotalExpenseWidget(),
            SizedBox(height: 14,),
            ExpenseFilterWidget(),
            SizedBox(height: 14,),
            ExpenseWidget()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.showAddExpenseSheet();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
