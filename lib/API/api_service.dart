import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel_expenses/domain/account/account_model.dart';
import 'package:travel_expenses/model/summary_model.dart';

class ApiService {
  static const String _baseUrl = 'http://10.254.251.126:3030';
  static const String _authToken =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0eXBlIjoiYXV0aGVudGljYXRpb24iLCJzdWIiOjEsImlhdCI6MTcxNzE2MjM3MywiZXhwIjoxNzE3NzY3MTczfQ.ZYklYZccsqfAOHWIA0-3cnkDkQL933Djrrxu3_hM80w'; // Provided token

  static Future<SummaryData> fetchSummaryData() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/summary'),
      headers: {
        'Authorization': _authToken,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return SummaryData.fromJson(json.decode(response.body)['data']);
    } else {
      throw Exception('Failed to load summary data: ${response.statusCode}');
    }
  }

  static Future<List<AccountData>> fetchAccountData() async {
    final response = await http.get(
      Uri.parse('$_baseUrl/account/me'),
      headers: {
        'Authorization': _authToken,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body)['data'];
      return body.map((dynamic item) => AccountData.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load account data: ${response.statusCode}');
    }
  }
}
