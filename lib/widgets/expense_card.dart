import 'package:flutter/material.dart';
import 'package:noexpenseapp/models/expense.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(expense.name),
                const SizedBox(height: 10),
                Text('\$${expense.amount.toStringAsFixed(2)}'),
              ],
            ),
            Row(
              children: [
                Icon(categoryIcons[expense.category]),
                const SizedBox(width: 10),
                Text(expense.getFormattedDate),
              ],
            )
          ],
        ),
      ),
    );
  }
}
