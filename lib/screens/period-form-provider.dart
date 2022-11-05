import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/models/period.dart';
import 'package:flutter/material.dart';

class PeriodFormProvider extends ChangeNotifier {
  Period _entity = Period();

  String? get description => _entity.description;

  set description(String? value) {
    _entity.description = value;
    notifyListeners();
  }

  DateTime? get initialDate => _entity.initialDate;

  set initialDate(DateTime? value) {
    _entity.initialDate = value;
    notifyListeners();
  }

  DateTime? get finalDate => _entity.finalDate;

  set finalDate(DateTime? value) {
    _entity.finalDate = value;
    notifyListeners();
  }

  Account? get account => _entity.account;

  set account(Account? value) {
    _entity.account = value;
    notifyListeners();
  }

  void save() {
    print(_entity);
  }
}