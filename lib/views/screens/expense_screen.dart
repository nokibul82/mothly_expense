import 'package:flutter/material.dart';
import 'package:mothly_expense/core/app_color.dart';
import '../../core/app_data.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: AppData.expenseList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Column(
              children: [
                Text(AppData.expenseList[index].date.day.toString()),
                Text(AppData.expenseList[index].date.month.toString()),
                Text(AppData.expenseList[index].date.year.toString())
              ],
            ),
            title: Text(AppData.expenseList[index].title ?? ""),
            subtitle: Text(AppData.expenseList[index].category.toString() ?? ""),
            trailing: Text(
                (AppData.expenseList[index].amount ?? 0.0).toStringAsFixed(2)),
          );
        },
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          showModalBottomSheet(
            enableDrag: true,
            showDragHandle: true,
            isScrollControlled: true,
            isDismissible: true,
            barrierLabel: "Close",
            backgroundColor: AppColor.secondary,
            context: context,
            builder: (BuildContext context) {
              final _formKey = GlobalKey<FormState>();
              String _title = "";
              DateTime _dateTime = DateTime.now();
              String type = "";
              double amount = 0.0;

              return Container(
                color: AppColor.secondary,
                height: MediaQuery.sizeOf(context).height * 0.7,
                width: MediaQuery.sizeOf(context).width,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          label: const Text("Title"),
                          labelStyle: Theme.of(context).textTheme.displaySmall,
                          filled: true,
                          fillColor: AppColor.light,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1.0, color: AppColor.dark),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value!.length < 2) {
                            return "Enter text having greater that 1 character";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.secondary),
            child: const Icon(
              Icons.add,
              color: AppColor.dark,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
