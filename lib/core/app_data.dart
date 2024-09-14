

import 'package:mothly_expense/models/category_model.dart';

import '../models/expense_model.dart';

class AppData {
  const AppData._();
  static var expenseList = <ExpenseModel>[
    ExpenseModel(id: "1", title: "Vagetables", category: Category.all, date: DateTime(2024,1), amount: 12.0),
    ExpenseModel(id: "2", title: "Eggs Lentil Atta", category: Category.food, date: DateTime(2024,2), amount: 12.0),
    ExpenseModel(id: "3", title: "Milk", category: Category.food, date: DateTime(2024,3), amount: 12.0),
    ExpenseModel(id: "4", title: "Mouse Pad", category: Category.food, date: DateTime(2024,4), amount: 12.0),
    ExpenseModel(id: "5", title: "Electricity", category: Category.food, date: DateTime(2024,4), amount: 12.0),
    ExpenseModel(id: "6", title: "Rice", category: Category.food, date: DateTime(2024,5), amount: 12.0),
    ExpenseModel(id: "7", title: "Fish", category: Category.food, date: DateTime(2024,5), amount: 12.0),
    ExpenseModel(id: "8", title: "Bus Fare", category: Category.food, date: DateTime(2024,6), amount: 12.0),
    ExpenseModel(id: "9", title: "Tea Biscuit", category: Category.food, date: DateTime(2024,7), amount: 12.0),
  ];

  static var typeList = <String>[
    "Grocery",
    "Shopping",
    "Transportation",
    "Pocket Money",
    "Utility & Bills"
  ];

  static var woolworthsCategoryList = [
    "pantry",
    "snacks & confectionery",
    "lunch box",
    "health & wellness",
    "freezer",
    "liquor",
    "beauty & personal care",
    "cleaning & maintenance",
    "pet",
    "fruit & veg",
    "drinks",
    "poultry, meat & seafood",
    "deli & chilled meals",
    "dairy, eggs & fridge",
    "baby",
    "bakery",
    "home & lifestyle"
  ];

}
