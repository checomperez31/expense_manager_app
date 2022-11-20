import 'package:expensemanager/constants.dart';
import 'package:expensemanager/utils/http-utils.dart';

import 'account-type.dart';

class AccountTypeWebService with HttpUtils {
  Future<List<AccountType>> getList() async {
    final res = await get(getUri(Constants.address, Constants.accountType));
    return AccountType.decodeListFromString( res.bodyBytes );
  }
}