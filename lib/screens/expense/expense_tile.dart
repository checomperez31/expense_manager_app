import 'package:expensemanager/app-routes.dart';
import 'package:expensemanager/models/expense/expense.dart';
import 'package:expensemanager/utils/format-utils.dart';
import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  final Expense entity;
  final VoidCallback? onUpdate;
  const ExpenseTile({Key? key, required this.entity, this.onUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(entity.description ?? 'Sin descripcion'),
    subtitle: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if ( entity.expenseDate != null ) Text(FormatUtils.formatDate(entity.expenseDate!, 'dd/MM/yyyy')),
        _ammount()
      ],
    ),
    onTap: () {
      Navigator.of(context).pushNamed(AppRoutes.expenseForm, arguments: entity).then((value) {
        if ( onUpdate != null ) onUpdate!();
      });
    },
  );

  Widget _ammount() {
    final color = entity.amount != null? (entity.amount! < 0? Colors.red: Colors.green): null;
    final style = TextStyle(color: color);
    final amountFragments = (entity.amount?.toString() ?? '0.0').split('.');
    return Row(
      children: [
        Text('\$', style: style),
        Text(amountFragments[0], style: style),
        Text('.', style: style),
        Text(amountFragments[1].padRight(2, '0'), style: style),
      ],
    );
  }
}
