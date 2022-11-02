import 'package:expensemanager/models/account-type-model/account-type-model.dart';
import 'package:expensemanager/models/account/account-service.dart';
import 'package:expensemanager/models/account/account.dart';
import 'package:flutter/cupertino.dart';

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

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  save() async {
    final service = AccountService();
    final res = await service.create( _entity );
  }
}