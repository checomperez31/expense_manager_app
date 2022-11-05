import 'package:expensemanager/constants.dart';
import 'package:expensemanager/models/expense-type/expense-type.dart';
import 'package:expensemanager/utils/http-utils.dart';

class ExpenseTypeService with HttpUtils {
  Future<List<ExpenseType>> getList() async {
    final res = await get(Constants.address, Constants.expenseType);
    return ExpenseType.decodeListFromString( res.bodyBytes );
  }
}