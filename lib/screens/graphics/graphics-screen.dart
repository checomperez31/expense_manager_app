import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:expensemanager/screens/graphics/global-chart-by-type-provider.dart';
import 'package:expensemanager/screens/graphics/global-chart-by-type.dart';

class GraphicsScreen extends StatelessWidget {
  const GraphicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => GlobalChartByTypeProvider())
    ],
    child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          GlobalChartByType()
        ]
    ),
  );
}
