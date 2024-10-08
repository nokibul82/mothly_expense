// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import 'category_model.dart';

class ExpenseModel extends Equatable {
  const ExpenseModel({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  @override
  List<Object?> get props => [
        id,
        title,
        amount,
        date,
        category,
      ];

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      id: json['id'],
      title: json['title'],
      amount: double.tryParse(json['amount']) ?? 0.0,
      date: DateTime.fromMillisecondsSinceEpoch(json['date']),
      category: Category.fromJson(json['category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount.toString(),
      'date': date.millisecondsSinceEpoch,
      'category': category.toJson(),
    };
  }

  ExpenseModel copyWith({
    String? title,
    double? amount,
    DateTime? date,
    Category? category,
  }) {
    return ExpenseModel(
      id: id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }

  @override
  bool get stringify => true;
}
