import 'package:expensemanager/constants.dart';
import 'package:expensemanager/models/expense-type/expense-type.dart';
import 'package:expensemanager/utils/http-utils.dart';

class ExpenseTypeService with HttpUtils {
  Future<List<ExpenseType>> getList() async {
    final res = await get(getUri(Constants.address, Constants.expenseType));
    var list = ExpenseType.decodeListFromString( res.bodyBytes );
    list.sort((a, b) => a.description!.compareTo(b.description!));
    return list;
  }
}