import 'package:expensemanager/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String defaultRoute = 'home';
  static String accountForm = 'account-form';
  static String accountDetails = 'account-details';
  static String expenseForm = 'expense-form';
  static String periodForm = 'period-form';
  static String periodDetails = 'period-details';

  static Map<String, Widget Function(BuildContext)> routes = {
    defaultRoute: (_) => HomeScreen(),
    accountForm: (_) => const AccountFormScreen(),
    accountDetails: (_) => const AccountDetailsScreen(),
    expenseForm: (_) => const ExpenseFormScreen(),
    periodForm: (_) => const PeriodFormScreen(),
    periodDetails: (_) => const PeriodDetailsScreen(),
  };
}