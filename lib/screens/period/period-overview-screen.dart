import 'package:expensemanager/screens/period/chart/chart-type-period-provider.dart';
import 'package:expensemanager/screens/period/chart/chart-type-period.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expensemanager/utils/money_formatter.dart';
import 'package:expensemanager/models/period/period.dart';
import 'package:expensemanager/screens/period/period-details-provider.dart';
import 'package:expensemanager/utils/utils.dart';
import 'package:expensemanager/widgets/description_tile.dart';

class PeriodOverview extends StatelessWidget {
  final Period entity;
  const PeriodOverview({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PeriodDetailsProvider( entity ),
      child: Consumer<PeriodDetailsProvider>(
          builder: (_, provider, __) => Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              if ( entity != null ) Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('Detalles'),
                                          DescriptionTile(title: 'Nombre', descriptionText: entity.description),
                                          if ( entity.initDate != null ) DescriptionTile(title: 'Inicio', descriptionText: FormatUtils.formatDate(entity.initDate!, 'dd-MM-yyyy')),
                                          if ( entity.finishDate != null ) DescriptionTile(title: 'Fin', descriptionText: FormatUtils.formatDate(entity.finishDate!, 'dd-MM-yyyy')),
                                          DescriptionTile(title: 'Ingresos', description: provider.loading ? const SizedBox(width: 15, height: 15, child: CircularProgressIndicator()): MoneyFormatter.format(provider.stats?.ingress, sinFondos: 'Sin calcular')),
                                          DescriptionTile(title: 'Gastos', description: provider.loading ? const SizedBox(width: 15, height: 15, child: CircularProgressIndicator()): MoneyFormatter.format(provider.stats?.expense, sinFondos: 'Sin calcular', forceNegative: true)),
                                          DescriptionTile(title: 'Restante', description: provider.loading ? const SizedBox(width: 15, height: 15, child: CircularProgressIndicator()): MoneyFormatter.format(provider.diff, sinFondos: 'Sin calcular')),
                                        ],
                                      )
                                  )
                                ],
                              ),
                            )
                          ),
                          if ( entity.id != null ) Card(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text('Detalles'),
                                            ChangeNotifierProvider(
                                                create: (_) => ChartTypePeriodProvider( entity.id! ),
                                                child: const ChartTypePeriod()
                                            )
                                          ],
                                        )
                                    )
                                  ],
                                ),
                              )
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}
