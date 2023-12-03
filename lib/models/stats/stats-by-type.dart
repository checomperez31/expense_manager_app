import 'dart:convert';
import 'dart:typed_data';

class StatsByType {
  int? id;
  String? description;
  double? amount;

  StatsByType({this.id, this.description, this.amount});

  factory StatsByType.fromMap(Map<String, dynamic> json) => StatsByType(
    id: json['id'],
    description: json['description'],
    amount: json['amount'],
  );

  factory StatsByType.fromJson(String str) => StatsByType.fromMap( json.decode(str) );

  static List<StatsByType> decodeListFromString(Uint8List bytes) {
    return listFromString( utf8.decode( bytes ) );
  }

  static List<StatsByType> listFromString(String str) {
    return (json.decode( str ) as List).map((e) => StatsByType.fromMap( e )).toList();
  }
}