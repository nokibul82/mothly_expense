import 'package:flutter/material.dart';
import '../extensions/extentions.dart';
import '../models/expense_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ExpenseModel? expense;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Monthly Expense"),
      ),
      body: const Column(
        children: [
          Text("Expense List"),
        ],
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
