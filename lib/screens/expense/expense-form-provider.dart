import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/models/expense-type/expense-type.dart';
import 'package:expensemanager/models/expense/expense-service.dart';
import 'package:expensemanager/models/expense/expense.dart';
import 'package:expensemanager/models/period/period.dart';
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

  ExpenseType? get type => _entity.type;

  set type(ExpenseType? value) {
    _entity.type = value;
    notifyListeners();
  }

  String? get amount => _entity.amount?.toString();

  set amount(String? value) {
    try {
      _entity.amount = double.parse(value ?? '');
    } catch (e) {}
    notifyListeners();
  }

  String get movementType => _entity.movementType;

  set movementType(String value) {
    _entity.movementType = value;
    notifyListeners();
  }

  bool get impact => _entity.impact;

  set impact(bool value) {
    _entity.impact = value;
    notifyListeners();
  }

  Period? get period => _entity.period;

  set period(Period? value) {
    _entity.period = value;
    notifyListeners();
  }

  DateTime? get expenseDate => _entity.expenseDate;

  set expenseDate(DateTime? value) {
    _entity.expenseDate = value;
    notifyListeners();
  }

  Future save() async {
    final service = ExpenseService();
    try {
      await service.create( _entity );
    } catch(e) {
      Future.error('Ha ocurrido un error');
    }
  }
}