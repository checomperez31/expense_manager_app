import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/models/expense/expense-service.dart';
import 'package:expensemanager/models/expense/expense.dart';
import 'package:flutter/foundation.dart';

class ExpensesAccountListProvider extends ChangeNotifier {
  final Account account;
  final ExpenseService _service = ExpenseService();
  List<Expense> elements = [];
  int page = 0;
  bool _loadingPage = false;

  ExpensesAccountListProvider(this.account) {
    refreshData();
  }

  Future refreshData() async {
    elements = await _service.getList(account: account.id);
    page = 0;
    notifyListeners();
  }

  Future loadAnotherPage() async {
    loadingPage = true;
    try {
      var nextPage = await _service.getList(page: page + 1, account: account.id);
      if ( nextPage.isNotEmpty ) {
        elements.addAll( nextPage );
        page++;
      }
    } catch (e) {
      print(e);
    }
    loadingPage = false;
  }

  bool get loadingPage => _loadingPage;

  set loadingPage(bool value) {
    _loadingPage = value;
    notifyListeners();
  }
}