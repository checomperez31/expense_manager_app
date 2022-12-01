import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/models/expense/expense-service.dart';
import 'package:expensemanager/models/expense/expense.dart';
import 'package:flutter/cupertino.dart';

class AccountDetailsProvider extends ChangeNotifier {
  final Account account;
  ExpenseStats? stats;
  bool _loading = false;

  AccountDetailsProvider(this.account) {
    getStats();
  }

  getStats() async {
    loading = true;
    stats = await ExpenseService().getStats(account: account.id);
    loading = false;
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
}