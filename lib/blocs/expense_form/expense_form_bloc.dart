import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../models/expense_model.dart';
import '../../models/category_model.dart';
import '../../repositories/expense_repository.dart';
part 'expense_form_event.dart';
part 'expense_form_state.dart';

class ExpenseFormBloc extends Bloc<ExpenseFormEvent, ExpenseFormState> {
  ExpenseFormBloc(
      {required ExpenseRepository repository, ExpenseModel? initalExpense})
      : _repository = repository,
        super(ExpenseFormState(
          dateTime: DateTime.now(),
          initialExpense: initalExpense,
          title: initalExpense?.title,
          amount: initalExpense?.amount,
          category: initalExpense?.category ?? Category.other,
        )) {
    on<ExpenseTitleChanged>(_onTitleChanged);
    on<ExpenseAmountChanged>(_onAmountChanged);
    on<ExpenseCategoryChanged>(_onCategoryChanged);
    on<ExpenseDateChanged>(_onDateChanged);
    on<ExpenseSubmitted>(_onSubmitted);
  }
  final ExpenseRepository _repository;
  void _onTitleChanged(
      ExpenseTitleChanged event, Emitter<ExpenseFormState> emit) {
    emit(state.copyWith(title: event.title));
  }

  void _onAmountChanged(
      ExpenseAmountChanged event, Emitter<ExpenseFormState> emit) {
    final amount = double.parse(event.amount);
    emit(state.copyWith(amount: amount));
  }

  void _onCategoryChanged(
      ExpenseCategoryChanged event, Emitter<ExpenseFormState> emit) {
    emit(state.copyWith(category: event.category));
  }

  void _onDateChanged(
      ExpenseDateChanged event, Emitter<ExpenseFormState> emit) {
    emit(state.copyWith(dateTime: event.date));
  }

  Future<void> _onSubmitted(
      ExpenseSubmitted event, Emitter<ExpenseFormState> emit) async {
    final expense = (state.initialExpense)?.copyWith(
            title: state.title,
            category: state.category,
            date: state.dateTime,
            amount: state.amount) ??
        ExpenseModel(
            id: const Uuid().v4(),
            title: state.title!,
            category: state.category,
            date: state.dateTime,
            amount: state.amount!);

    emit(state.copyWith(status: ExpenseFormStatus.loading));

    try {
      await _repository.createExpense(expense);
      emit(state.copyWith(status: ExpenseFormStatus.success));
      emit(ExpenseFormState(dateTime: DateTime.now()));
    } catch (e) {
      print("Creation failed:$e");
      emit(state.copyWith(status: ExpenseFormStatus.failure));
    }
  }
}
