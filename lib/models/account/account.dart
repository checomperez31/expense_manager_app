import 'dart:convert';
import 'dart:typed_data';

import 'package:expensemanager/models/account-type-model/account-type-model.dart';
import 'package:expensemanager/models/catalog.dart';

class Account implements Catalog {
  String? id;
  String? name;
  AccountType? type;

  Account({this.id, this.name, this.type});

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'type': type?.toMap()
  };

  String toJson() => json.encode( toMap() );

  @override
  String? get identifier => id;

  @override
  String? get description => name;

  factory Account.fromMap(Map<String, dynamic> json) => Account(
    id: json['id'],
    name: json['name'],
    type: json['type'] != null? AccountType.fromMap( json['type'] ): null,
  );

  factory Account.fromJson(String str) => Account.fromMap( json.decode( str ) );

  static List<Account> decodeListFromString(Uint8List bytes) {
    return listFromString( utf8.decode( bytes ) );
  }

  static List<Account> listFromString(String str) {
    return (json.decode( str ) as List).map((e) => Account.fromMap( e )).toList();
  }
}