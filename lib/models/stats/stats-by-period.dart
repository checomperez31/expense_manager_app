import 'dart:convert';
import 'dart:typed_data';

class StatsByPeriod {
  String? account;
  String? period;
  String? expense;
  double? amount;

  StatsByPeriod({this.account, this.period, this.expense, this.amount});

  factory StatsByPeriod.fromMap(Map<String, dynamic> json) => StatsByPeriod(
    account: json['account'],
    period: json['period'],
    expense: json['expense'],
    amount: json['amount'],
  );

  factory StatsByPeriod.fromJson(String str) => StatsByPeriod.fromMap( json.decode(str) );

  static List<StatsByPeriod> decodeListFromString(Uint8List bytes) {
    return listFromString( utf8.decode( bytes ) );
  }

  static List<StatsByPeriod> listFromString(String str) {
    return (json.decode( str ) as List).map((e) => StatsByPeriod.fromMap( e )).toList();
  }
}