import 'dart:convert';

import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/models/expense-type/expense-type.dart';
import 'package:expensemanager/models/period/period.dart';
import 'package:expensemanager/utils/utils.dart';
import 'package:flutter/foundation.dart';

class Expense {
  String? id;
  Account? account;
  String? description;
  ExpenseType? type;
  Expense? parent;
  double? amount;
  String movementType;
  bool impact;
  Period? period;
  DateTime? expenseDate;
  Account? accountToTransfer;

  Expense({
    this.id,
    this.account,
    this.description,
    this.type,
    this.parent,
    this.amount,
    this.period,
    this.expenseDate,
    this.movementType = 'G',
    this.impact = true,
    this.accountToTransfer,
  });

  Map<String, dynamic> toCreateMap() => {
    'id': id,
    'account': account?.toMap(),
    'description': description,
    'type': type?.toMap(),
    'parent': parent?.toMap(),
    'amount': amount,
    'period': period?.toMap(),
    'expenseDate': FormatUtils.dateToServerFormat(expenseDate),
    'movementType': movementType,
    'impact': impact,
    'accountDestination': accountToTransfer?.toMap(),
  };

  Map<String, dynamic> toMap() => {
    'id': id,
    'account': account?.toMap(),
    'description': description,
    'type': type?.toMap(),
    'parent': parent?.toMap(),
    'amount': amount,
    'period': period?.toMap(),
    'expenseDate': FormatUtils.dateToServerFormat(expenseDate),
    'movementType': movementType,
    'impact': impact,
    'accountDestination': accountToTransfer?.toMap(),
  };

  String toCreateJson() => json.encode( toCreateMap() );

  String toJson() => json.encode( toMap() );

  @override
  String toString() {
    return 'Expense{id: $id, account: $account, description: $description, type: $type, parent: $parent, amount: $amount, period: $period, expenseDate: $expenseDate}';
  }

  factory Expense.fromMap(Map<String, dynamic> json) => Expense(
    id: json['id'],
    account: json['account'] != null? Account.fromMap(json['account']): null,
    description: json['description'],
    type: json['type'] != null? ExpenseType.fromMap(json['type']): null,
    parent: json['parent'] != null? Expense.fromMap(json['parent']): null,
    amount: json['amount'] != null? double.tryParse(json['amount']!.toString()): null,
    period: json['period'] != null? Period.fromMap(json['period']): null,
    expenseDate: json['expenseDate'] != null? FormatUtils.dateFromServer(json['expenseDate']): null,
    movementType: json['movementType'] ?? 'G',
    impact: json['impact'] ?? true,
    accountToTransfer: json['accountDestination'] != null? Account.fromMap(json['accountDestination']): null,
  );

  factory Expense.fromJson(String str) => Expense.fromMap( json.decode(str) );

  static List<Expense> decodeListFromString(Uint8List bytes) {
    return listFromString( utf8.decode( bytes ) );
  }

  static List<Expense> listFromString(String str) {
    return (json.decode( str ) as List).map((e) => Expense.fromMap( e )).toList();
  }
}

class ExpenseStats {
  double? expense;
  double? ingress;

  ExpenseStats({this.expense, this.ingress});

  factory ExpenseStats.fromMap(Map<String, dynamic> json) => ExpenseStats(
    expense: json['expense'] != null? double.tryParse(json['expense'].toString()): null,
    ingress: json['ingress'] != null? double.tryParse(json['ingress'].toString()): null,
  );

  factory ExpenseStats.fromJson(List<int> data) => ExpenseStats.fromMap( json.decode( utf8.decode( data ) ) );
}