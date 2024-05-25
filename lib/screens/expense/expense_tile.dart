import 'package:expensemanager/app-routes.dart';
import 'package:expensemanager/constants.dart';
import 'package:expensemanager/models/expense/expense.dart';
import 'package:expensemanager/utils/font-awesome-icons-mapper.dart';
import 'package:expensemanager/utils/format-utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExpenseTile extends StatelessWidget {
  final Expense entity;
  final VoidCallback? onUpdate;
  const ExpenseTile({Key? key, required this.entity, this.onUpdate}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
    leading: _icon(entity),
    minLeadingWidth: 30,
    title: Text(entity.description ?? 'Sin descripcion'),
    subtitle: Row(
      children: [
        Expanded(child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(entity.account?.description ?? 'Sin cuenta'),
                Text(entity.type?.description ?? 'Sin tipo'),
              ],
            ),
            const SizedBox(height: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if ( entity.expenseDate != null ) Text(FormatUtils.formatDate(entity.expenseDate!, 'dd/MM/yyyy'))
                else const Text(''),
                _ammount()
              ],
            )
          ],
        ))
      ],
    ),
    onTap: () {
      Navigator.of(context).pushNamed(AppRoutes.expenseForm, arguments: entity).then((value) {
        if ( onUpdate != null ) onUpdate!();
      });
    },
  );

  Widget _ammount() {
    final color = entity.movementType == 'T' ? (Constants.blue) : (entity.amount != null? (entity.amount! < 0? Constants.red: Constants.green): null);
    final style = TextStyle(color: color);
    final amountFragments = (entity.amount?.toString() ?? '0.0').split('.');
    return Row(
      children: [
        if ( entity.movementType == 'I' ) FaIcon(FontAwesomeIcons.arrowUp, size: 11, color: color),
        if ( entity.movementType == 'G' ) FaIcon(FontAwesomeIcons.arrowDown, size: 11, color: color),
        if ( entity.movementType == 'T' ) FaIcon(FontAwesomeIcons.arrowsUpDown, size: 11, color: color),
        Text('\$', style: style),
        Text(amountFragments[0], style: style),
        Text('.', style: style),
        Text(amountFragments[1].padRight(2, '0'), style: style),
      ],
    );
  }


  Widget? _icon(Expense entity) {
    if ( entity.type == null || entity.type?.icon == null ) return null;
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: fromHex(entity.type!.color!, '30'),
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Center(
        child: FaIcon(FontAwesomeIconsMapper.getIcon( entity.type!.icon! ), color: fromHex(entity.type!.color!, 'ff'), size: 15),
      )
    );
  }

  static Color fromHex(String hexString, String alpha) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write(alpha);
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
