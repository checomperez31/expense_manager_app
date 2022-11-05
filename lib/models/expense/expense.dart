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
  int? amount;
  Period? period;
  DateTime? expenseDate;

  Expense({
    this.id,
    this.account,
    this.description,
    this.type,
    this.parent,
    this.amount,
    this.period,
    this.expenseDate
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'account': account?.toMap(),
    'description': description,
    'type': type?.toMap(),
    'parent': parent?.toMap(),
    'amount': amount,
    'period': period?.toMap(),
    'expenseDate': FormatUtils.dateToServerFormat(expenseDate),
  };

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
    amount: json['amount'],
    period: json['period'] != null? Period.fromMap(json['period']): null,
    expenseDate: json['expenseDate'] != null? FormatUtils.dateFromServer(json['expenseDate']): null,
  );

  factory Expense.fromJson(String str) => Expense.fromMap( json.decode(str) );

  static List<Expense> decodeListFromString(Uint8List bytes) {
    return listFromString( utf8.decode( bytes ) );
  }

  static List<Expense> listFromString(String str) {
    return (json.decode( str ) as List).map((e) => Expense.fromMap( e )).toList();
  }
}