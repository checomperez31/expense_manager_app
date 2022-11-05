import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/models/period/period-service.dart';
import 'package:expensemanager/models/period/period.dart';
import 'package:flutter/material.dart';

class PeriodFormProvider extends ChangeNotifier {
  Period _entity = Period();

  String? get description => _entity.description;

  set description(String? value) {
    _entity.description = value;
    notifyListeners();
  }

  DateTime? get initialDate => _entity.initDate;

  set initialDate(DateTime? value) {
    _entity.initDate = value;
    notifyListeners();
  }

  DateTime? get finalDate => _entity.finishDate;

  set finalDate(DateTime? value) {
    _entity.finishDate = value;
    notifyListeners();
  }

  Account? get account => _entity.account;

  set account(Account? value) {
    _entity.account = value;
    notifyListeners();
  }

  void save() async {
    final service = PeriodService();
    final created = await service.create(_entity);
    print(created);
  }
}