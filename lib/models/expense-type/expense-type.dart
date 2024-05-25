import 'dart:convert';
import 'dart:typed_data';

import 'package:expensemanager/models/catalog.dart';

class ExpenseType implements Catalog {
  int? id;

  @override
  String? description;
  String? icon;
  String? color;

  ExpenseType({required this.id, required this.description, this.icon, this.color});

  Map<String, dynamic> toMap() => {
    'id': id,
    'description': description,
    'icon': icon,
    'color': color,
  };

  @override
  int? get identifier => id;

  factory ExpenseType.fromMap(Map<String, dynamic> json) => ExpenseType(
    id: json['id'],
    description: json['description'],
    icon: json['icon'],
    color: json['color'],
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