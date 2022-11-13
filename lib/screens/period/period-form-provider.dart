import 'package:expensemanager/models/period/period-service.dart';
import 'package:expensemanager/models/period/period.dart';
import 'package:flutter/material.dart';

class PeriodFormProvider extends ChangeNotifier {
  final Period _entity;

  PeriodFormProvider(Period? entity): _entity = entity ?? Period();

  String? get description => _entity.description;

  set description(String? value) {
    _entity.description = value;
    notifyListeners();
  }

  DateTime? get initialDate => _entity.initDate;

  set initialDate(DateTime? value) {
    _entity.initDate = value;
    notifyListeners();
  }

  DateTime? get finalDate => _entity.finishDate;

  set finalDate(DateTime? value) {
    _entity.finishDate = value;
    notifyListeners();
  }

  Future save() async {
    final service = PeriodService();
    try {
      if ( _entity.id == null ) {
        await service.create( _entity );
      } else {
        await service.update( _entity );
      }
    } catch(e) {
      Future.error('Ha ocurrido un error');
    }
  }
}