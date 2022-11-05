import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/models/period.dart';

class Expense {
  String? id;
  Account? account;
  String? description;
  String? type;
  int? quantity;
  Period? period;
  DateTime? date;

  Expense({
    this.id,
    this.account,
    this.description,
    this.type,
    this.quantity,
    this.period,
    this.date
  });

  @override
  String toString() {
    return 'Expense{id: $id, account: $account, description: $description, type: $type, quantity: $quantity, period: $period, date: $date}';
  }
}