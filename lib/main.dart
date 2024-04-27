import 'package:flutter/material.dart';
import 'package:noexpenseapp/consts/colors.dart';
import 'package:noexpenseapp/widgets/expenses_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(backgroundColor: kColorScheme.onPrimaryContainer, foregroundColor: kColorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(color: kColorScheme.secondaryContainer, margin: const EdgeInsets.all(10)),
        // textTheme: ThemeData().textTheme.copyWith(titleLarge: const TextStyle(fontWeight: FontWeight.w100)),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(backgroundColor: kDarkColorScheme.onPrimaryContainer, foregroundColor: kDarkColorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(color: kDarkColorScheme.secondaryContainer, margin: const EdgeInsets.all(10)),
        // textTheme: ThemeData().textTheme.copyWith(titleLarge: const TextStyle(fontWeight: FontWeight.w100)),
      ),
      home: const ExpensesPage(),
    );
  }
}
