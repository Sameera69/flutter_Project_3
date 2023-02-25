import 'package:flutter_application_project_3/moduls/Meal.dart';

class OrderC {
  final String id;
  final String date;
  final String state;
  final List meals;
  static bool thereIsOrder = false;

  const OrderC({
    required this.id,
    required this.date,
    required this.state,
    required this.meals,
  });

  factory OrderC.fromMap(Map<String, dynamic> map) {
    return OrderC(
      id: map['id'],
      date: map['date'],
      state: map['state'],
      meals: map['meals'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'state': state,
      'meals': meals,
    };
  }
}
