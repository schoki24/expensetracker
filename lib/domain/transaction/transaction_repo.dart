import 'dart:convert';

import 'package:travel_expenses/domain/transaction/transaction_model.dart';
import 'package:travel_expenses/plugins/http.dart';

class TransactionRepo {
  Future<List<TransactionModel>> loadMyTransactions() async {
    final res = await GetRequest('transaction/me');
    List<TransactionModel> tempArr = [];

    for (final data in jsonDecode(res.body)['data']) {
      tempArr.add(TransactionModel(
        id: data['id'],
        createdAt: data['createdAt'],
        updatedAt: data['updatedAt'],
        title: data['title'],
        note: data['note'],
        document: data['document'],
        amount: data['amount'],
        type: data['type'],
      ));
    }
    return tempArr;
  }
}
