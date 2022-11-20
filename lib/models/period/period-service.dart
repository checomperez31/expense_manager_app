import 'package:expensemanager/constants.dart';
import 'package:expensemanager/models/period/period.dart';
import 'package:expensemanager/utils/http-utils.dart';

class PeriodService with HttpUtils {
  Future<Period> create(Period entity) async {
    final response = await makePost(Constants.address, Constants.period, entity.toJson());
    process( response );
    print( response.body );
    return Period.fromJson( response.body );
  }

  Future<Period> update(Period entity) async {
    final response = await makePut(Constants.address, Constants.period, entity.toJson());
    process( response );
    print( response.body );
    return Period.fromJson( response.body );
  }

  Future<List<Period>> getList() async {
    final response = await get(getUri(Constants.address, Constants.period));
    process( response );
    return Period.decodeListFromString( response.bodyBytes );
  }
}