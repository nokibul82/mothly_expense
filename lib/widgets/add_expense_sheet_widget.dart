import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../blocs/expense_form/expense_form_bloc.dart';
import '../models/category_model.dart';

class AddExpenseSheetWidget extends StatelessWidget {
  const AddExpenseSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.viewInsetsOf(context),
      child: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitleFieldWidget(),
            SizedBox(
              height: 15,
            ),
            AmountFieldWidget(),
            SizedBox(
              height: 15,
            ),
            CategoryFieldWidget(),
            SizedBox(
              height: 15,
            ),
            DateFieldWidget(),
            SizedBox(
              height: 15,
            ),
            AddButtonWidget(),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final state = context.watch<ExpenseFormBloc>().state;
    final isLoading = state.status == ExpenseFormStatus.loading;

    return FilledButton(
        onPressed: isLoading || !state.isFormValid
            ? null
            : () {
                context.read<ExpenseFormBloc>().add(const ExpenseSubmitted());
                Navigator.pop(context);
              },
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                "Add",
                style: textTheme.displayMedium,
              ));
  }
}

class DateFieldWidget extends StatelessWidget {
  const DateFieldWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final bloc = context.read<ExpenseFormBloc>();
    final state = context.watch<ExpenseFormBloc>().state;

    final formattedDate = state.initialExpense == null
        ? DateFormat("dd/MM/yyyy").format(state.dateTime)
        : DateFormat("dd/MM/yyyy").format(state.initialExpense!.date);

    return GestureDetector(
      onTap: () async {
        final today = DateTime.now();
        final selectedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            lastDate: DateTime(today.year + 50));
        if (selectedDate != null) {
          bloc.add(ExpenseDateChanged(selectedDate));
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Date',
            style: textTheme.labelLarge?.copyWith(
              color: colorScheme.onBackground.withOpacity(0.4),
              height: 1,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Text(formattedDate, style: textTheme.titleLarge),
        ],
      ),
    );
  }
}

class CategoryFieldWidget extends StatelessWidget {
  const CategoryFieldWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final bloc = context.read<ExpenseFormBloc>();
    final state = context.watch<ExpenseFormBloc>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Select Category',
          style: textTheme.labelLarge?.copyWith(
            color: colorScheme.onBackground.withOpacity(0.4),
            height: 1,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 0,
          children: Category.values
              .where((category) => category != Category.all)
              .map((currentCategory) => ChoiceChip(
                    label: Text(currentCategory.toName),
                    selected: currentCategory == state.category,
                    onSelected: (_) => bloc.add(
                      ExpenseCategoryChanged(currentCategory),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class AmountFieldWidget extends StatelessWidget {
  const AmountFieldWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final state = context.watch<ExpenseFormBloc>().state;

    return TextFormField(
      keyboardType: TextInputType.number,
      style: textTheme.displaySmall?.copyWith(fontSize: 20),
      onChanged: (value) {
        context
            .read<ExpenseFormBloc>()
            .add(ExpenseAmountChanged(value));
      },
      initialValue: state.initialExpense?.amount.toString(),
      decoration: InputDecoration(
          enabled: state.status != ExpenseFormStatus.loading,
          border: InputBorder.none,
          hintText: "Amount",
          prefixText: '\$'),
    );
  }
}

class TitleFieldWidget extends StatelessWidget {
  const TitleFieldWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final state = context.watch<ExpenseFormBloc>().state;

    return TextFormField(
      style: textTheme.displaySmall?.copyWith(fontSize: 30),
      onChanged: (value) {
        context.read<ExpenseFormBloc>().add(ExpenseTitleChanged(value));
      },
      initialValue: state.initialExpense?.title,
      decoration: InputDecoration(
          enabled: state.status != ExpenseFormStatus.loading,
          border: InputBorder.none,
          hintText: "Title"),
    );
  }
}
