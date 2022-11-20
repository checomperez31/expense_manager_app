import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/screens/account/expenses-account-list-provider.dart';
import 'package:expensemanager/screens/expense/expense_tile.dart';
import 'package:expensemanager/utils/infinite_scroll.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modalEntity = ModalRoute.of(context)?.settings.arguments as Account?;
    return Scaffold(
      appBar: AppBar(
        title: Text(modalEntity?.description ?? 'Detalles de cuenta'),
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          if ( modalEntity != null ) Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nombre: ${modalEntity.description}'),
                      Text('Cantidad: ${modalEntity.amount}'),
                    ],
                  ),
                ),
                Expanded(
                  child: ChangeNotifierProvider<ExpensesAccountListProvider>(
                    create: (_) => ExpensesAccountListProvider(modalEntity),
                    child: Consumer<ExpensesAccountListProvider>(
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
                    )
                  )
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
