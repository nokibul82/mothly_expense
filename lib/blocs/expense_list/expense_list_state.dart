part of 'expense_list_bloc.dart';

enum ExpenseListStatus { initial, loading, success, failure }

final class ExpenseListState extends Equatable {
  const ExpenseListState(
      {this.expenses = const [],
      this.status = ExpenseListStatus.initial,
      this.totalExpense = 0.0,
      this.filter = Category.all});
  final List<ExpenseModel?> expenses;
  final ExpenseListStatus status;
  final double totalExpense;
  final Category filter;

  Iterable<ExpenseModel?> get filteredExpenses => filter.applyAll(expenses);

  ExpenseListState copyWith(
      {ExpenseListStatus Function()? status,
      List<ExpenseModel?> Function()? expenses,
      double Function()? totalExpense,
      Category Function()? filter}) {
    return ExpenseListState(
        expenses: expenses != null ? expenses() : this.expenses,
        status: status != null ? status() : this.status,
        totalExpense: totalExpense != null ? totalExpense() : this.totalExpense,
        filter: filter != null ? filter() : this.filter);
  }

  factory ExpenseListState.initial() => const ExpenseListState();

  @override
  List<Object?> get props => [expenses, status, totalExpense, filter];
}

final class ExpenseListInitial extends ExpenseListState {}
