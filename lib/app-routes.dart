import 'package:expensemanager/screens/account-form-screen.dart';
import 'package:expensemanager/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String defaultRoute = 'home';
  static String accountForm = 'account-form';

  static Map<String, Widget Function(BuildContext)> routes = {
    defaultRoute: (_) => HomeScreen(),
    accountForm: (_) => const AccountFormScreen(),
  };
}