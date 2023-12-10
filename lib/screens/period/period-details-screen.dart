import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expensemanager/app-routes.dart';
import 'package:expensemanager/models/period/period.dart';
import 'package:expensemanager/screens/expense/expense_tile.dart';
import 'package:expensemanager/screens/period/expenses-period-list-provider.dart';
import 'package:expensemanager/screens/period/period-overview-screen.dart';
import 'package:expensemanager/utils/infinite_scroll.dart';

class PeriodDetailsScreen extends StatelessWidget {

  const PeriodDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modalEntity = ModalRoute.of(context)?.settings.arguments as Period?;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(modalEntity?.description ?? 'Detalles del periodo'),
            actions: [
              IconButton(onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.periodForm, arguments: modalEntity);
              }, icon: const Icon(Icons.edit))
            ],
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.area_chart)),
                Tab(icon: Icon(Icons.list))
              ],
            ),
          ),
          body: TabBarView(
            children: [
              if ( modalEntity != null ) PeriodOverview(entity: modalEntity),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if ( modalEntity != null ) Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: ChangeNotifierProvider<ExpensesPeriodListProvider>(
                                create: (_) => ExpensesPeriodListProvider(modalEntity),
                                child: Consumer<ExpensesPeriodListProvider>(
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
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}
