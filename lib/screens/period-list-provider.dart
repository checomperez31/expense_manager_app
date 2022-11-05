import 'package:expensemanager/models/period/period-service.dart';
import 'package:expensemanager/models/period/period.dart';
import 'package:flutter/material.dart';

class PeriodListProvider extends ChangeNotifier {
  final PeriodService _service = PeriodService();
  List<Period> elements = [];

  Future refreshData() async {
    elements = await _service.getList();
    notifyListeners();
  }
}