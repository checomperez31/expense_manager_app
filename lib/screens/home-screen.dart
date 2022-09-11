import 'package:expensemanager/app-routes.dart';
import 'package:expensemanager/screens/screens.dart';
import 'package:expensemanager/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final PageController pageController = PageController();
  int actualPage = 0;
   
  HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: const [
          ExpensesScreen(),
          AccountsScreen(),
          PeriodsScreen()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          switch(actualPage) {
            case 0:
              Navigator.of(context).pushNamed(AppRoutes.expenseForm);
              break;
            case 1:
              Navigator.of(context).pushNamed(AppRoutes.accountForm);
              break;
            case 2:
              Navigator.of(context).pushNamed(AppRoutes.periodForm);
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