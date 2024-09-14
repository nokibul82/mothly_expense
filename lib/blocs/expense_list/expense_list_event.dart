part of 'expense_list_bloc.dart';

sealed class ExpenseListEvent extends Equatable {
  const ExpenseListEvent();
  @override
  List<Object> get props => [];
}

final class ExpenseListSubscriptionRequested extends ExpenseListEvent {
  const ExpenseListSubscriptionRequested();
}

final class ExpenseListExpenseDeleted extends ExpenseListEvent {
  const ExpenseListExpenseDeleted({required this.expenseModel});
  final ExpenseModel expenseModel;

  @override
  List<Object> get props => [expenseModel];
}

final class ExpenseListCategoryFilterChanged extends ExpenseListEvent {
  const ExpenseListCategoryFilterChanged({required this.filter});
  final Category filter;

  @override
  List<Object> get props => [filter];
}
