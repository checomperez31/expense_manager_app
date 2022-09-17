import 'dart:convert';
import 'dart:typed_data';

class AccountType {
  final int id;
  final String description;

  AccountType({required this.id, required this.description});

  factory AccountType.fromMap(Map<String, dynamic> json) => AccountType(
    id: json['id'],
    description: json['description'],
  );

  factory AccountType.fromJson(String str) => AccountType.fromMap( json.decode( str ) );

  static List<AccountType> decodeListFromString(Uint8List bytes) {
    return listFromString( utf8.decode( bytes ) );
  }

  static List<AccountType> listFromString(String str) {
    return (json.decode( str ) as List).map((e) => AccountType.fromJson( e )).toList();
  }
}