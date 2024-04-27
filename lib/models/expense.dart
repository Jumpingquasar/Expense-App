import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();

class Expense {
  final String id;
  final String name;
  final double amount;
  final DateTime date;
  final ExpenseCategory category;

  Expense({required this.name, required this.amount, required this.date, required this.category}) : id = uuid.v4();

  String get getFormattedDate {
    return formatter.format(date);
  }
}

enum ExpenseCategory {
  food,
  travel,
  home,
}

const categoryIcons = {
  ExpenseCategory.food: Icons.lunch_dining,
  ExpenseCategory.home: Icons.home,
  ExpenseCategory.travel: Icons.local_taxi,
};

class ExpenseBucket {
  final ExpenseCategory category;
  final List<Expense> expenses;

  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) : expenses = allExpenses.where((expense) => expense.category == category).toList();

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
