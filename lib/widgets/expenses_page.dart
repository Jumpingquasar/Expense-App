import 'package:flutter/material.dart';
import 'package:noexpenseapp/models/expenses_list.dart';
import 'package:noexpenseapp/widgets/add_expense_modal.dart';
import 'package:noexpenseapp/widgets/charts/chart.dart';

import '../models/expense.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() {
    return _ExpensesPageState();
  }
}

class _ExpensesPageState extends State<ExpensesPage> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: AddExpenseModal(
          onAddExpense: _addExpense,
        ),
      ),
    );
  }

  final List<Expense> _registeredExpenses = [
    Expense(name: 'Chinese', amount: 150, date: DateTime.utc(2021, 5, 21), category: ExpenseCategory.food),
    Expense(name: 'Burger', amount: 80, date: DateTime.utc(2023, 2, 22), category: ExpenseCategory.food),
    Expense(name: 'Chinese', amount: 150, date: DateTime.utc(2021, 5, 21), category: ExpenseCategory.food),
    Expense(name: 'Burger', amount: 80, date: DateTime.utc(2023, 2, 22), category: ExpenseCategory.food),
    Expense(name: 'Chinese', amount: 150, date: DateTime.utc(2021, 5, 21), category: ExpenseCategory.food),
    Expense(name: 'Burger', amount: 80, date: DateTime.utc(2023, 2, 22), category: ExpenseCategory.food),
    Expense(name: 'Chinese', amount: 150, date: DateTime.utc(2021, 5, 21), category: ExpenseCategory.food),
    Expense(name: 'Burger', amount: 80, date: DateTime.utc(2023, 2, 22), category: ExpenseCategory.food),
    Expense(name: 'Chinese', amount: 150, date: DateTime.utc(2021, 5, 21), category: ExpenseCategory.food),
    Expense(name: 'Burger', amount: 80, date: DateTime.utc(2023, 2, 22), category: ExpenseCategory.food),
    Expense(name: 'Chinese', amount: 150, date: DateTime.utc(2021, 5, 21), category: ExpenseCategory.food),
    Expense(name: 'Burger', amount: 80, date: DateTime.utc(2023, 2, 22), category: ExpenseCategory.food),
    Expense(name: 'Chinese', amount: 150, date: DateTime.utc(2021, 5, 21), category: ExpenseCategory.food),
    Expense(name: 'Burger', amount: 80, date: DateTime.utc(2023, 2, 22), category: ExpenseCategory.food),
    Expense(name: 'Chinese', amount: 150, date: DateTime.utc(2021, 5, 21), category: ExpenseCategory.food),
    Expense(name: 'Burger', amount: 80, date: DateTime.utc(2023, 2, 22), category: ExpenseCategory.food),
    Expense(name: 'Chinese', amount: 150, date: DateTime.utc(2021, 5, 21), category: ExpenseCategory.food),
    Expense(name: 'Burger', amount: 80, date: DateTime.utc(2023, 2, 22), category: ExpenseCategory.food),
    Expense(name: 'Chinese', amount: 150, date: DateTime.utc(2021, 5, 21), category: ExpenseCategory.food),
    Expense(name: 'Burger', amount: 80, date: DateTime.utc(2023, 2, 22), category: ExpenseCategory.food),
    Expense(name: 'Chinese', amount: 150, date: DateTime.utc(2021, 5, 21), category: ExpenseCategory.food),
    Expense(name: 'Burger', amount: 80, date: DateTime.utc(2023, 2, 22), category: ExpenseCategory.food),
    Expense(name: 'Chinese', amount: 150, date: DateTime.utc(2021, 5, 21), category: ExpenseCategory.food),
    Expense(name: 'Burger', amount: 80, date: DateTime.utc(2023, 2, 22), category: ExpenseCategory.food),
    Expense(name: 'Chinese', amount: 150, date: DateTime.utc(2021, 5, 21), category: ExpenseCategory.food),
    Expense(name: 'Burger', amount: 80, date: DateTime.utc(2023, 2, 22), category: ExpenseCategory.food),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('helll'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  Widget emptyExpenseList = const Center(child: Text('No expenses found. Start adding some!'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: _registeredExpenses.isEmpty
          ? emptyExpenseList
          : Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: ExpensesList(
                    expenses: _registeredExpenses,
                    onRemoveExpense: _removeExpense,
                  ),
                ),
              ],
            ),
    );
  }
}
