import 'package:expensemanager/app-routes.dart';
import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/screens/account/account-details-provider.dart';
import 'package:expensemanager/screens/account/expenses-account-list-provider.dart';
import 'package:expensemanager/screens/expense/expense_tile.dart';
import 'package:expensemanager/utils/infinite_scroll.dart';
import 'package:expensemanager/utils/money_formatter.dart';
import 'package:expensemanager/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modalEntity = ModalRoute.of(context)?.settings.arguments as Account?;
    return ChangeNotifierProvider(
      create: (_) => AccountDetailsProvider( modalEntity! ),
      child: Consumer<AccountDetailsProvider>(
        builder: (_, provider, __) => Scaffold(
            appBar: AppBar(
              title: Text(modalEntity?.description ?? 'Detalles de cuenta'),
              actions: [
                IconButton(onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.accountForm, arguments: modalEntity);
                }, icon: const Icon(Icons.edit))
              ],
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
                            const Text('Detalles'),
                            const SizedBox(height: 8),
                            DescriptionTile(title: 'Nombre', descriptionText: '${modalEntity.description}'),
                            DescriptionTile(title: 'Cantidad', description: MoneyFormatter.format(modalEntity.amount)),
                            DescriptionTile(title: 'Tipo', descriptionText: modalEntity.type?.description),
                            DescriptionTile(title: 'Ingresos', description: provider.loading ? const SizedBox(width: 15, height: 15, child: CircularProgressIndicator()): MoneyFormatter.format(provider.stats?.ingress, sinFondos: 'Sin calcular')),
                            DescriptionTile(title: 'Gastos', description: provider.loading ? const SizedBox(width: 15, height: 15, child: CircularProgressIndicator()): MoneyFormatter.format(provider.stats?.expense, sinFondos: 'Sin calcular', forceNegative: true)),
                            const SizedBox(height: 8),
                            const Text('Movimientos'),
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
        ),
      ),
    );
  }
}
