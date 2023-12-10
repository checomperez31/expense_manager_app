import 'package:expensemanager/constants.dart';
import 'package:expensemanager/models/stats/stats-by-period.dart';
import 'package:expensemanager/models/stats/stats-by-type.dart';
import 'package:expensemanager/utils/http-utils.dart';

class StatsByTypeService with HttpUtils {
  Future<List<StatsByType>> getList() async {
    final res = await get(getUri(Constants.address, Constants.globalStatsByType));
    return StatsByType.decodeListFromString( res.bodyBytes );
  }

  Future<List<StatsByPeriod>> getPeriodList(String period) async {
    final res = await get(getUri(Constants.address, '${Constants.statsByType}/$period'));
    return StatsByPeriod.decodeListFromString( res.bodyBytes );
  }
}