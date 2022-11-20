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

  Future<List<Expense>> getList({int page = 0, String? account}) async {
    final uri = getUri(Constants.address, Constants.expense, params: {
      'page': page.toString(),
      if ( account != null ) 'account.equal': account
    });
    final response = await get(uri);
    process( response );
    return Expense.decodeListFromString( response.bodyBytes );
  }
}