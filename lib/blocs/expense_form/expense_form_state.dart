part of 'expense_form_bloc.dart';

enum ExpenseFormStatus { initial, loading, success, failure }

final class ExpenseFormState extends Equatable {
  const ExpenseFormState(
      {this.title,
      this.category = Category.other,
      required this.dateTime,
      this.amount,
      this.status = ExpenseFormStatus.initial,
      this.initialExpense
      });
  final String? title;
  final Category category;
  final DateTime dateTime;
  final double? amount;
  final ExpenseFormStatus? status;
  final ExpenseModel? initialExpense;

  ExpenseFormState copyWith(
      {String? title,
      Category? category,
      DateTime? dateTime,
      double? amount,
      ExpenseFormStatus? status,
      ExpenseModel? initialExpense
      }) {
    return ExpenseFormState(
        title: title ?? this.title,
        category: category ?? this.category,
        dateTime: dateTime ?? this.dateTime,
        amount: amount ?? this.amount,
        status: status ?? this.status,
        initialExpense: initialExpense ?? this.initialExpense
    );
  }

  @override
  List<Object?> get props => [title, category, dateTime, amount, status,initialExpense];

  bool get isFormValid => (title != null && amount != null);
}
