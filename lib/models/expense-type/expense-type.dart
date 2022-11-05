import 'dart:convert';
import 'dart:typed_data';

import 'package:expensemanager/models/catalog.dart';

class ExpenseType implements Catalog {
  int? id;

  @override
  String? description;

  ExpenseType({required this.id, required this.description});

  Map<String, dynamic> toMap() => {
    'id': id,
    'description': description,
  };

  @override
  int? get identifier => id;

  factory ExpenseType.fromMap(Map<String, dynamic> json) => ExpenseType(
    id: json['id'],
    description: json['description'],
  );

  factory ExpenseType.fromJson(String str) => ExpenseType.fromMap( json.decode( str ) );

  static List<ExpenseType> decodeListFromString(Uint8List bytes) {
    return listFromString( utf8.decode( bytes ) );
  }

  static List<ExpenseType> listFromString(String str) {
    return (json.decode( str ) as List).map((e) => ExpenseType.fromMap( e )).toList();
  }

  @override
  String toString() {
    return 'ExpenseType{id: $id, description: $description}';
  }
}