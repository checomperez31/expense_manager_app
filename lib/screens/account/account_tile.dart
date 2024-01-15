import 'package:expensemanager/app-routes.dart';
import 'package:expensemanager/constants.dart';
import 'package:expensemanager/models/account/account.dart';
import 'package:flutter/material.dart';

class AccountTile extends StatelessWidget {
  final Account entity;
  final VoidCallback? onUpdate;
  const AccountTile({Key? key, required this.entity, this.onUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(entity.name ?? 'Sin nombre'),
    subtitle: Text(entity.amount?.toString() ?? 'Sin fondos', style: TextStyle(
      color: entity.amount != null? (entity.amount! < 0? Constants.red: Constants.green): null
    )),
    onTap: () {
      Navigator.of(context).pushNamed(AppRoutes.accountDetails, arguments: entity).then((value) {
        if ( onUpdate != null ) onUpdate!();
      });
    },
  );
}
