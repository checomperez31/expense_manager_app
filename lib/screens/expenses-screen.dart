import 'package:expensemanager/screens/expenses-list-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<ExpenseListProvider>(
    builder: (_, provider, __) => RefreshIndicator(
      onRefresh: provider.refreshData,
      child: ListView(
        children: provider.elements.map((e) => ListTile(
          title: Text(e.description ?? 'Sin nombre'),
        )).toList(),
      ),
    ),
  );
}
