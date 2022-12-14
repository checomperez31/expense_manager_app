import 'package:expensemanager/models/expense/expense-service.dart';
import 'package:expensemanager/models/expense/expense.dart';
import 'package:flutter/foundation.dart';

class ExpenseListProvider extends ChangeNotifier {
  final ExpenseService _service = ExpenseService();
  List<Expense> elements = [];
  int page = 0;
  bool _loadingPage = false;

  ExpenseListProvider() {
    refreshData();
  }

  Future refreshData() async {
    elements = await _service.getList();
    page = 0;
    notifyListeners();
  }

  Future loadAnotherPage() async {
    loadingPage = true;
    try {
      var nextPage = await _service.getList(page: page + 1);
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