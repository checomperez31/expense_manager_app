import 'package:expensemanager/models/expense/expense-service.dart';
import 'package:expensemanager/models/expense/expense.dart';
import 'package:flutter/foundation.dart';

class ExpenseListProvider extends ChangeNotifier {
  final ExpenseService _service = ExpenseService();
  List<Expense> elements = [];

  Future refreshData() async {
    elements = await _service.getList();
    notifyListeners();
  }
}