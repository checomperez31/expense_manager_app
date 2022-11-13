import 'package:expensemanager/app-routes.dart';
import 'package:expensemanager/models/period/period.dart';
import 'package:expensemanager/utils/format-utils.dart';
import 'package:flutter/material.dart';

class PeriodTile extends StatelessWidget {
  final Period entity;
  final VoidCallback? onUpdate;
  const PeriodTile({Key? key, required this.entity, this.onUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
    title: Text(entity.description ?? 'Sin descripcion'),
    subtitle: Row(
      children: [
        if ( entity.initDate != null ) Text(FormatUtils.formatDate(entity.initDate!, 'dd/MM/yyyy')),
        if ( entity.initDate != null && entity.finishDate != null ) const Text(' - '),
        if ( entity.finishDate != null ) Text(FormatUtils.formatDate(entity.finishDate!, 'dd/MM/yyyy'))
      ],
    ),
    onTap: () {
      Navigator.of(context).pushNamed(AppRoutes.periodForm, arguments: entity).then((value) {
        if ( onUpdate != null ) onUpdate!();
      });
    },
  );
}
