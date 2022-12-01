import 'package:expensemanager/app-routes.dart';
import 'package:expensemanager/models/period/period.dart';
import 'package:expensemanager/screens/period/period-details-provider.dart';
import 'package:expensemanager/utils/money_formatter.dart';
import 'package:expensemanager/utils/utils.dart';
import 'package:expensemanager/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PeriodDetailsScreen extends StatelessWidget {

  const PeriodDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modalEntity = ModalRoute.of(context)?.settings.arguments as Period?;
    return ChangeNotifierProvider(
      create: (_) => PeriodDetailsProvider( modalEntity! ),
      child: Consumer<PeriodDetailsProvider>(
        builder: (_, provider, __) => Scaffold(
            appBar: AppBar(
              title: Text(modalEntity?.description ?? 'Detalles del periodo'),
              actions: [
                IconButton(onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.accountForm, arguments: modalEntity);
                }, icon: const Icon(Icons.edit))
              ],
            ),
            body: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                if ( modalEntity != null ) Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Detalles'),
                            const SizedBox(height: 8),
                            DescriptionTile(title: 'Nombre', descriptionText: modalEntity.description),
                            if ( modalEntity.initDate != null ) DescriptionTile(title: 'Inicio', descriptionText: FormatUtils.formatDate(modalEntity.initDate!, 'dd-MM-yyyy')),
                            if ( modalEntity.finishDate != null ) DescriptionTile(title: 'Fin', descriptionText: FormatUtils.formatDate(modalEntity.finishDate!, 'dd-MM-yyyy')),
                            DescriptionTile(title: 'Ingresos', description: provider.loading ? const SizedBox(width: 15, height: 15, child: CircularProgressIndicator()): MoneyFormatter.format(provider.stats?.ingress, sinFondos: 'Sin calcular')),
                            DescriptionTile(title: 'Gastos', description: provider.loading ? const SizedBox(width: 15, height: 15, child: CircularProgressIndicator()): MoneyFormatter.format(provider.stats?.expense, sinFondos: 'Sin calcular', forceNegative: true)),
                            const SizedBox(height: 8),
                            const Text('Movimientos'),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
