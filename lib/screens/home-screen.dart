import 'package:expensemanager/app-routes.dart';
import 'package:expensemanager/screens/account/account-list-provider.dart';
import 'package:expensemanager/screens/expense/expenses-list-provider.dart';
import 'package:expensemanager/screens/period/period-list-provider.dart';
import 'package:expensemanager/screens/screens.dart';
import 'package:expensemanager/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final PageController pageController = PageController();
  int actualPage = 0;
   
  HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Administracion'),
      ),
      body: PageView(
        controller: pageController,
        children: [
          ExpensesScreen(),
          const AccountsScreen(),
          const PeriodsScreen()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          switch(actualPage) {
            case 0:
              Navigator.of(context).pushNamed(AppRoutes.expenseForm).then((value) {
                final provider = Provider.of<ExpenseListProvider>(context, listen: false);
                provider.refreshData();
              });
              break;
            case 1:
              Navigator.of(context).pushNamed(AppRoutes.accountForm).then((value) {
                final provider = Provider.of<AccountListProvider>(context, listen: false);
                provider.refreshData();
              });
              break;
            case 2:
              Navigator.of(context).pushNamed(AppRoutes.periodForm).then((value) {
                final provider = Provider.of<PeriodListProvider>(context, listen: false);
                provider.refreshData();
              });
              break;
          }
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: BottomBarOptions(
          actualIndex: actualPage,
          onSelect: _goToPage,
        ),
      ),
    );
  }

  _goToPage(int index) {
    actualPage = index;
    pageController.jumpToPage( actualPage );
  }
}