import '../models/expense_model.dart';

import '../data/local_data_storage.dart';

class ExpenseRepository {
  ExpenseRepository({
    required LocalDataStorage storage,
  }) : _storage = storage;
  final LocalDataStorage _storage;

  Future<void> createExpense(ExpenseModel expense) =>
      _storage.saveExpance(expense);

  Future<void> deleteExpense(String id) => _storage.deleteExpance(id);

  Stream<List<ExpenseModel?>> getAllExpense() => _storage.getExpenses();
}
