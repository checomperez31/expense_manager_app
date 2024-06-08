import 'package:expensemanager/models/stats/stats-by-period.dart';
import 'package:expensemanager/models/stats/stats-by-type-service.dart';
import 'package:flutter/material.dart';

class ChartTypePeriodProvider extends ChangeNotifier {
  final StatsByTypeService _service = StatsByTypeService();
  List<StatsByPeriod> elementsByType = [];
  String period;

  ChartTypePeriodProvider(this.period) {
    refreshData();
  }

  Future refreshData() async {
    elementsByType = await _service.getPeriodStats( period );
    notifyListeners();
  }
}