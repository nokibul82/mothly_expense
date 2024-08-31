

import '../models/expense_model.dart';

class AppData {
  const AppData._();
  static var expenseList = <ExpenseModel>[
    ExpenseModel(id: "1", title: "Vagetables", type: "Grocery", dateTime: DateTime(2024,1), amount: 12.0),
    ExpenseModel(id: "2", title: "Eggs Lentil Atta", type: "Grocery", dateTime: DateTime(2024,2), amount: 12.0),
    ExpenseModel(id: "3", title: "Milk", type: "Grocery", dateTime: DateTime(2024,3), amount: 12.0),
    ExpenseModel(id: "4", title: "Mouse Pad", type: "Shopping", dateTime: DateTime(2024,4), amount: 12.0),
    ExpenseModel(id: "5", title: "Electricity", type: "Utility & Bills", dateTime: DateTime(2024,4), amount: 12.0),
    ExpenseModel(id: "6", title: "Rice", type: "Grocery", dateTime: DateTime(2024,5), amount: 12.0),
    ExpenseModel(id: "7", title: "Fish", type: "Grocery", dateTime: DateTime(2024,5), amount: 12.0),
    ExpenseModel(id: "8", title: "Bus Fare", type: "Transportation", dateTime: DateTime(2024,6), amount: 12.0),
    ExpenseModel(id: "9", title: "Tea Biscuit", type: "Pocket Money", dateTime: DateTime(2024,7), amount: 12.0),
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
