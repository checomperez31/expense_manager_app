import 'package:expensemanager/models/expense/expense-service.dart';
import 'package:expensemanager/models/expense/expense.dart';
import 'package:expensemanager/models/period/period.dart';
import 'package:flutter/cupertino.dart';

class PeriodDetailsProvider extends ChangeNotifier {
  final Period period;
  ExpenseStats? stats;
  double diff = 0;
  bool _loading = false;

  PeriodDetailsProvider(this.period) {
    getStats();
  }

  getStats() async {
    loading = true;
    stats = await ExpenseService().getStats(period: period.id);
    if ( stats != null && stats!.expense != null && stats!.ingress != null ) diff = stats!.ingress! - stats!.expense!;
    print( diff );
    loading = false;
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }
}