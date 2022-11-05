import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/models/expense/expense.dart';
import 'package:expensemanager/models/period.dart';
import 'package:flutter/material.dart';

class ExpenseFormProvider extends ChangeNotifier {
  Expense _entity = Expense();

  Account? get account => _entity.account;

  set account(Account? value) {
    _entity.account = value;
    notifyListeners();
  }

  String? get description => _entity.description;

  set description(String? value) {
    _entity.description = value;
    notifyListeners();
  }

  String? get type => _entity.type;

  set type(String? value) {
    _entity.type = value;
    notifyListeners();
  }

  String? get quantity => _entity.quantity?.toString();

  set quantity(String? value) {
    try {
      _entity.quantity = int.parse(value ?? '');
    } catch (e) {}
    notifyListeners();
  }

  Period? get period => _entity.period;

  set period(Period? value) {
    _entity.period = value;
    notifyListeners();
  }

  DateTime? get date => _entity.date;

  set date(DateTime? value) {
    _entity.date = value;
    notifyListeners();
  }

  void save() {
    print(_entity);
  }
}