import 'package:expensemanager/screens/account-list-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<AccountListProvider>(
    builder: (_, provider, __) => RefreshIndicator(
      onRefresh: provider.refreshData,
      child: ListView(
        children: provider.elements.map((e) => ListTile(
          title: Text(e.name ?? 'Sin nombre'),
          subtitle: Text(e.amount?.toString() ?? 'Cantidad no especificada'),
        )).toList(),
      ),
    ),
  );
}
