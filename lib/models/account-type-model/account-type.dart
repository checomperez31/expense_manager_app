import 'dart:convert';
import 'dart:typed_data';

import 'package:expensemanager/models/catalog.dart';

class AccountType extends Catalog {
  int? id;

  @override
  String? description;

  AccountType({required this.id, required this.description});

  Map<String, dynamic> toMap() => {
    'id': id,
    'description': description,
  };

  @override
  int? get identifier => id;

  factory AccountType.fromMap(Map<String, dynamic> json) => AccountType(
    id: json['id'],
    description: json['description'],
  );

  factory AccountType.fromJson(String str) => AccountType.fromMap( json.decode( str ) );

  static List<AccountType> decodeListFromString(Uint8List bytes) {
    return listFromString( utf8.decode( bytes ) );
  }

  static List<AccountType> listFromString(String str) {
    return (json.decode( str ) as List).map((e) => AccountType.fromMap( e )).toList();
  }

  @override
  String toString() {
    return 'AccountType{id: $id, description: $description}';
  }
}