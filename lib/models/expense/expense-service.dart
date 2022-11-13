import 'package:expensemanager/constants.dart';
import 'package:expensemanager/models/expense/expense.dart';
import 'package:expensemanager/utils/utils.dart';

class ExpenseService with HttpUtils {
  Future<Expense> create(Expense entity) async {
    final response = await makePost(Constants.address, Constants.expense, entity.toJson());
    process( response );
    print( response.body );
    return Expense.fromJson( response.body );
  }

  Future<Expense> update(Expense entity) async {
    final response = await makePut(Constants.address, Constants.expense, entity.toJson());
    process( response );
    print( response.body );
    return Expense.fromJson( response.body );
  }

  Future<List<Expense>> getList() async {
    final response = await get(Constants.address, Constants.expense);
    process( response );
    return Expense.decodeListFromString( response.bodyBytes );
  }
}