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
        children: [
          AccountsScreen(),
          ExpensesScreen(),
          PeriodsScreen()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          switch(actualPage) {
            case 0:
              break;
            case 1:
              break;
            case 2:
              break;
          }
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Padding(
          padding: const EdgeInsets.only(right: 80),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              BottomBarButton(
                onPressed: pageController.jumpToPage,
                index: 0,
                icon: Icons.credit_card,
                title: 'Cuentas',
              ),
              BottomBarButton(
                onPressed: pageController.jumpToPage,
                index: 1,
                icon: Icons.wallet,
                title: 'Gastos',
              ),
              BottomBarButton(
                onPressed: pageController.jumpToPage,
                index: 2,
                icon: Icons.calendar_month_outlined,
                title: 'Periodos',
              ),
            ],
          ),
        ),
      ),
    );
  }
}