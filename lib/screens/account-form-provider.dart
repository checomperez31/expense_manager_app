import 'package:expensemanager/main.dart';
import 'package:expensemanager/models/account-type-model/account-type-model.dart';
import 'package:expensemanager/models/account/account-service.dart';
import 'package:expensemanager/models/account/account.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountFormProvider extends ChangeNotifier {
  final Account _entity = Account();
  bool _loading = false;

  String? get name => _entity.name;

  set name(String? value) {
    _entity.name = value;
    notifyListeners();
  }

  AccountType? get type => _entity.type;

  set type(AccountType? value) {
    _entity.type = value;
    notifyListeners();
  }

  String? get amount => _entity.amount?.toString() ?? '0.0';

  set amount(String? value) {
    try {
      _entity.amount = double.tryParse(value ?? '0.0');
    } catch (e) {}
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future save() async {
    final service = AccountService();
    try {
      await service.create( _entity );
    } catch(e) {
      Future.error('Ha ocurrido un error');
    }
  }
}