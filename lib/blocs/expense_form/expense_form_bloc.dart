import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mothly_expense/models/expense_model.dart';
import 'package:uuid/uuid.dart';
import '../../repositories/expense_repository.dart';

part 'expense_form_event.dart';
part 'expense_form_state.dart';

class ExpenseFormBloc extends Bloc<ExpenseFormEvent, ExpenseFormState> {
  ExpenseFormBloc({required ExpenseRepository repository})
      : _repository = repository,
        super(ExpenseFormState(dateTime: DateTime.now())) {
    on<ExpenseTitleChanged>(_onTitleChanged);
    on<ExpenseAmountChanged>(_onAmountChanged);
    on<ExpenseTypeChanged>(_onTypeChanged);
    on<ExpenseDateChanged>(_onDateChanged);
  }
  final ExpenseRepository _repository;
  void _onTitleChanged(
      ExpenseTitleChanged event, Emitter<ExpenseFormState> emit) {
    emit(state.copyWith(title: event.title));
  }

  void _onAmountChanged(
      ExpenseAmountChanged event, Emitter<ExpenseFormState> emit) {
    emit(state.copyWith(amount: event.amount));
  }

  void _onTypeChanged(
      ExpenseTypeChanged event, Emitter<ExpenseFormState> emit) {
    emit(state.copyWith(type: event.type));
  }

  void _onDateChanged(
      ExpenseDateChanged event, Emitter<ExpenseFormState> emit) {
    emit(state.copyWith(dateTime: event.date));
  }

  Future<void> _onSubmitted(
      ExpenseSubmitted event, Emitter<ExpenseFormState> emit) async {
    final expense = ExpenseModel(
        id: const Uuid().v4(),
        title: state.title,
        type: state.type,
        dateTime: state.dateTime,
        amount: state.amount);

    emit(state.copyWith(status: ExpenseFormStatus.loading));

    try {
      await _repository.createExpense(expense);
      emit(state.copyWith(status: ExpenseFormStatus.success));
      emit(ExpenseFormState(dateTime: DateTime.now()));
    } catch (e) {
      emit(state.copyWith(status: ExpenseFormStatus.failure));
    }
  }
}
