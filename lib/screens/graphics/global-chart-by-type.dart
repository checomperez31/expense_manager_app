import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:graphic/graphic.dart';
import 'package:expensemanager/models/stats/stats-by-type.dart';
import 'package:expensemanager/screens/graphics/global-chart-by-type-provider.dart';

class GlobalChartByType extends StatelessWidget {
  const GlobalChartByType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<GlobalChartByTypeProvider>(
    builder: (_, provider, __) => Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: Row(
          children: [
            Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Gastos por tipo'),
                    SizedBox(
                      width: double.infinity,
                      height: 400,
                      child: provider.elementsByType.isNotEmpty ? Chart<StatsByType>(
                        data: provider.elementsByType,
                        variables: {
                          'tipo': Variable(
                            accessor: (stat) => stat.description as String,
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
                                variable: 'tipo', values: Defaults.colors20
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
      ),
    )
  );
}
