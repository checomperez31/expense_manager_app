import 'package:flutter/material.dart';

class MoneyFormatter {
  static Widget format(double? money, {String sinFondos = 'Sin fondos', bool forceNegative = false}) {
    if ( money == null ) return Text(sinFondos);
    if ( forceNegative && money > 0) money *= -1;
    final color = money < 0? Colors.red: Colors.green;
    final style = TextStyle(color: color);
    final amountFragments = (money.toString()).split('.');
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