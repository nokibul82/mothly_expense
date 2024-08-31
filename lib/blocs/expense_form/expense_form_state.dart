part of 'expense_form_bloc.dart';

enum ExpenseFormStatus { initial, loading, success, failure }

final class ExpenseFormState extends Equatable {
  const ExpenseFormState(
      {this.title,
      this.type,
      required this.dateTime,
      this.amount,
      this.status = ExpenseFormStatus.initial});
  final String? title;
  final String? type;
  final DateTime dateTime;
  final double? amount;
  final ExpenseFormStatus? status;

  ExpenseFormState copyWith(
      {String? title,
      String? type,
      DateTime? dateTime,
      double? amount,
      ExpenseFormStatus? status}) {
    return ExpenseFormState(
        title: title ?? this.title,
        type: type ?? this.type,
        dateTime: dateTime ?? this.dateTime,
        amount: amount ?? this.amount,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [title, type, dateTime, amount, status];

  bool get isFormValid => (title != null && amount != null);
}
