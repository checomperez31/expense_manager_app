import 'package:expensemanager/models/account/account-service.dart';
import 'package:expensemanager/models/account/account.dart';
import 'package:flutter/cupertino.dart';

class AccountListProvider extends ChangeNotifier {
  final AccountService service = AccountService();
  List<Account> elements = [];

  Future refreshData() async {
    elements = await service.getList();
    notifyListeners();
  }
}