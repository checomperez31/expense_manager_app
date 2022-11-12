import 'package:expensemanager/models/account/account.dart';
import 'package:flutter/material.dart';

class AccountTile extends StatelessWidget {
  final Account entity;
  const AccountTile({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(entity.name ?? 'Sin nombre'),
    subtitle: Text(entity.amount?.toString() ?? 'Sin fondos', style: TextStyle(
      color: entity.amount != null? (entity.amount! < 0? Colors.red: Colors.green): null
    )),
  );
}
