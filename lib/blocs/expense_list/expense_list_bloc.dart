import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repositories/expense_repository.dart';

import '../../models/expense_model.dart';
import '../../models/category_model.dart';

part 'expense_list_event.dart';
part 'expense_list_state.dart';

class ExpenseListBloc extends Bloc<ExpenseListEvent, ExpenseListState> {
  ExpenseListBloc({required ExpenseRepository repository})
      : _repository = repository,
        super(ExpenseListInitial()) {
    on<ExpenseListSubscriptionRequested>(_onSubscriptionRequested);
    on<ExpenseListExpenseDeleted>(_onExpenseDeleted);
    on<ExpenseListCategoryFilterChanged>((event, emit) {});
  }

  final ExpenseRepository _repository;

  Future<void> _onSubscriptionRequested(ExpenseListSubscriptionRequested event,
      Emitter<ExpenseListState> emit) async {
    emit(state.copyWith(status: () => ExpenseListStatus.loading));
    final stream = _repository.getAllExpense();
    await emit.forEach<List<ExpenseModel?>>(
      stream,
      onData: (expenses) => state.copyWith(
        status: () => ExpenseListStatus.success,
        expenses: () => expenses,
        totalExpense: () => expenses
            .map((currentExpense) => currentExpense?.amount)
            .fold(0.0, (a, b) => a + b!),
      ),
      onError: (error, stackTrace) =>
          state.copyWith(status: () => ExpenseListStatus.failure),
    );
  }

  Future<void> _onExpenseDeleted(
      ExpenseListExpenseDeleted event, Emitter<ExpenseListState> emit) async {
    await _repository.deleteExpense(event.expenseModel.id);
  }

  Future<void> _onCategoryFilterChanged(ExpenseListCategoryFilterChanged event,
      Emitter<ExpenseListState> emit) async {
    emit(state.copyWith(filter: () => event.filter));
  }
}
