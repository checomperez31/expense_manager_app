import 'package:expensemanager/constants.dart';
import 'package:expensemanager/models/account/account.dart';
import 'package:expensemanager/utils/http-utils.dart';

class AccountService with HttpUtils {
  Future<Account> create(Account entity) async {
    final response = await makePost(Constants.address, Constants.account, entity.toJson());
    process( response );
    return Account.fromJson( response.body );
  }

  Future<Account> update(Account entity) async {
    final response = await makePut(Constants.address, Constants.account, entity.toJson());
    process( response );
    return Account.fromJson( response.body );
  }

  Future<List<Account>> getList() async {
    final response = await get(Constants.address, Constants.account);
    process( response );
    return Account.decodeListFromString( response.bodyBytes );
  }
}