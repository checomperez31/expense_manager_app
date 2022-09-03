import 'package:expensemanager/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static String defaultRoute = 'home';

  static Map<String, Widget Function(BuildContext)> routes = {
    defaultRoute: (_) => HomeScreen()
  };
}