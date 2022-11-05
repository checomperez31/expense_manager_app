import 'dart:convert';
import 'dart:typed_data';

import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/models/catalog.dart';
import 'package:expensemanager/utils/utils.dart';

class Period implements Catalog {
  String? id;

  @override
  String? description;
  DateTime? initDate;
  DateTime? finishDate;
  Account? account;

  Period({
    this.id,
    this.description,
    this.initDate,
    this.finishDate,
    this.account
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'description': description,
    'initDate': FormatUtils.dateToServerFormat(initDate),
    'finishDate': FormatUtils.dateToServerFormat(finishDate),
    'account': account?.toMap(),
  };

  String toJson() => json.encode( toMap() );

  @override
  String toString() {
    return 'Period{id: $id, description: $description, initialDate: $initDate, finalDate: $finishDate, account: $account}';
  }

  @override
  get identifier => id;

  factory Period.fromMap(Map<String, dynamic> json) => Period(
    id: json['id'],
    description: json['description'],
    initDate: json['initDate'] != null? FormatUtils.dateFromServer(json['initDate']): null,
    finishDate: json['finishDate'] != null? FormatUtils.dateFromServer(json['finishDate']): null,
    account: json['account'] != null? Account.fromMap(json['account']): null,
  );

  factory Period.fromJson(String str) => Period.fromMap( json.decode(str) );

  static List<Period> decodeListFromString(Uint8List bytes) {
    return listFromString( utf8.decode( bytes ) );
  }

  static List<Period> listFromString(String str) {
    return (json.decode( str ) as List).map((e) => Period.fromMap( e )).toList();
  }
}