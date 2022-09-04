import 'package:expensemanager/screens/screens.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final PageController pageController = PageController();
   
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
        onPressed: () {},
        child: Icon(Icons.add),
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
              Expanded(
                child: TextButton(
                    onPressed: () => pageController.jumpToPage(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add),
                        Text('Cuentas')
                      ],
                    )
                ),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () => pageController.jumpToPage(1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add),
                        Text('Gastos')
                      ],
                    )
                ),
              ),
              Expanded(
                child: TextButton(
                    onPressed: () => pageController.jumpToPage(2),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add),
                        Text('Periodos')
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}