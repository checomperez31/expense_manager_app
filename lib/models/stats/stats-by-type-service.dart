import 'package:expensemanager/constants.dart';
import 'package:expensemanager/models/stats/stats-by-type.dart';
import 'package:expensemanager/utils/http-utils.dart';

class StatsByTypeService with HttpUtils {
  Future<List<StatsByType>> getList() async {
    final res = await get(getUri(Constants.address, Constants.statsByType));
    return StatsByType.decodeListFromString( res.bodyBytes );
  }
}