import 'dart:convert';

import 'package:mothly_expense/models/expense_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataStorage {
  final SharedPreferences _preferences;

  LocalDataStorage({required SharedPreferences preferences})
      : _preferences = preferences;
  final _controller = BehaviorSubject<List<ExpenseModel?>>.seeded(const []);
  static const expenseCollectionKey = "expense_collection_key";
  void _initialize() {
    final expensesJson = _preferences.getString(expenseCollectionKey);
    if (expensesJson != null) {
      final expenseList = List<dynamic>.from(jsonDecode(expensesJson) as List);
      final expenses =
          expenseList.map((e) => ExpenseModel.fromJson(e)).toList();
      _controller.add(expenses);
    } else {
      _controller.add(const []);
    }
  }

  Future<void> saveExpance(ExpenseModel expense) async {
    final expenses = [..._controller.value];
    final expenseIndex = expenses
        .indexWhere((currentExpense) => currentExpense?.id == expense.id);
    if (expenseIndex <= 0) {
      expenses[expenseIndex] = expense;
    } else {
      expenses.add(expense);
    }
    _controller.add(expenses);
    await _preferences.setString(expenseCollectionKey, jsonEncode(expenses));
  }

  Future<void> deleteExpance(String id) async {
    final expenses = [..._controller.value];
    final expenseIndex =
        expenses.indexWhere((currentExpense) => currentExpense?.id == id);
    if (expenseIndex == -1) {
      throw Exception("No expense found");
    } else {
      expenses.removeAt(expenseIndex);
    }
  }

  Stream<List<ExpenseModel?>> getExpenses() => _controller.asBroadcastStream();
}
