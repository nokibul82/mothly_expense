import 'package:equatable/equatable.dart';

class ExpenseModel extends Equatable {
  final String id;
  final String? title;
  final String? type;
  final DateTime dateTime;
  final double? amount;
  ExpenseModel(
      {required this.id,
      required this.title,
      required this.type,
      required this.dateTime,
      required this.amount});

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, type, dateTime, amount];

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        dateTime: DateTime.fromMillisecondsSinceEpoch(json["dateTime"]),
        amount: double.tryParse(json["amount"]) ?? 0.0,
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "type": type,
      "dateTime": dateTime.millisecondsSinceEpoch,
      "amount": amount
    };
  }

  ExpenseModel copyWith({
    String? title,
    double? amount,
    DateTime? dateTime,
    String? type,
  }) {
    return ExpenseModel(
        id: id,
        title: title ?? this.title,
        type: type ?? this.type,
        dateTime: dateTime ?? this.dateTime,
        amount: amount ?? this.amount);
  }
}
