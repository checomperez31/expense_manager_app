import 'package:expensemanager/models/account/account.dart';

class Period {
  String? id;
  String? description;
  DateTime? initialDate;
  DateTime? finalDate;
  Account? account;

  Period({
    this.id,
    this.description,
    this.initialDate,
    this.finalDate,
    this.account
  });

  @override
  String toString() {
    return 'Period{id: $id, description: $description, initialDate: $initialDate, finalDate: $finalDate, account: $account}';
  }
}