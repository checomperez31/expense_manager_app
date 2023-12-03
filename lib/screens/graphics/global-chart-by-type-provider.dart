import 'package:expensemanager/models/period/period-service.dart';
import 'package:expensemanager/models/period/period.dart';
import 'package:expensemanager/models/stats/stats-by-type-service.dart';
import 'package:expensemanager/models/stats/stats-by-type.dart';
import 'package:flutter/material.dart';

class GlobalChartByTypeProvider extends ChangeNotifier {
  final StatsByTypeService _service = StatsByTypeService();
  List<StatsByType> elementsByType = [];

  GlobalChartByTypeProvider() {
    refreshData();
  }

  Future refreshData() async {
    elementsByType = await _service.getList();
    notifyListeners();
  }
}