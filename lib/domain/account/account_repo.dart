import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_expenses/plugins/http.dart';

import 'account_model.dart';

class AccountRepo {
  Future loadAccounts() async {
    final res = await GetRequest('account');
    print(jsonDecode(res.body));
    List<AccountModel> tempAccounts = [];
    for (final acc in jsonDecode(res.body)['data']) {
      tempAccounts.add(AccountModel.fromJson(acc));
    }
    return tempAccounts;
  }

  Future<List<AccountModel>> loadMyAccounts() async {
    final res = await GetRequest('account/me');
    List<AccountModel> tempAccounts = [];
    for (final acc in jsonDecode(res.body)['data']) {
      tempAccounts.add(AccountModel.fromJson(acc));
    }
    return tempAccounts;
  }
}
