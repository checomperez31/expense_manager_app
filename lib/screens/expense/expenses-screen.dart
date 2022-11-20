import 'package:expensemanager/screens/expense/expense_tile.dart';
import 'package:expensemanager/screens/expense/expenses-list-provider.dart';
import 'package:expensemanager/utils/infinite_scroll.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensesScreen extends StatelessWidget {
  ExpensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<ExpenseListProvider>(
    builder: (_, provider, __) => RefreshIndicator(
      onRefresh: provider.refreshData,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: InfiniteScroll(onLoadMore: provider.loadAnotherPage),
        itemBuilder: (_, index) => ExpenseTile(entity: provider.elements[index], onUpdate: provider.refreshData),
        itemCount: provider.elements.length,
        separatorBuilder: (_, index) => const Divider(height: 1),
      ),
    ),
  );
}
