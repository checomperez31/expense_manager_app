import 'package:expensemanager/models/stats/stats-by-period.dart';
import 'package:expensemanager/screens/period/chart/chart-type-period-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:graphic/graphic.dart';

class ChartTypePeriod extends StatelessWidget {
  const ChartTypePeriod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<ChartTypePeriodProvider>(
    builder: (_, provider, __) => Row(
      children: [
        Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Gastos por tipo'),
                SizedBox(
                  width: double.infinity,
                  height: 370,
                  child: provider.elementsByType.isNotEmpty ? Chart<StatsByPeriod>(
                    data: provider.elementsByType,
                    variables: {
                      'tipo': Variable(
                        accessor: (stat) => stat.expense as String,
                      ),
                      'gasto': Variable(
                        accessor: (stat) => stat.amount as num,
                      ),
                    },
                    transforms: [
                      Proportion(
                        variable: 'gasto',
                        as: 'percent',
                      )
                    ],
                    marks: [
                      IntervalMark(
                        position: Varset('percent') / Varset('tipo'),
                        label: LabelEncode(
                            encoder: (tuple) => Label(
                              '${tuple['tipo']}',
                              LabelStyle(textStyle: Defaults.runeStyle),
                            )
                        ),
                        color: ColorEncode(
                            variable: 'tipo', values: provider.elementsByType.map((e) => fromHex(e.color ?? '#00ffff', 'ff')).toList()
                        ),
                        modifiers: [StackModifier()],
                      )
                    ],
                    coord: PolarCoord(transposed: true, dimCount: 1),
                  ): const CircularProgressIndicator(),
                ),
              ],
            )
        )
      ],
    ),
  );

  static Color fromHex(String hexString, String alpha) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write(alpha);
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
