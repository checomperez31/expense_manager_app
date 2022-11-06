import 'package:expensemanager/screens/period-list-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PeriodsScreen extends StatelessWidget {
  const PeriodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<PeriodListProvider>(
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
