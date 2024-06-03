import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_expenses/config/baseURL.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_expenses/plugins/local_shared_preferences.dart';

Future GetRequest(url) async {
  Map<String, String> headers = {
    'Authorization': 'Bearer ${await getTokenFromLocalStorage()}'
  };
  return http.get(Uri.parse(BaseConfig().baseUrl + url), headers: headers);
}

Future PostRequest(url, body) async {
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer ${await getTokenFromLocalStorage()}'
  };
  return await http.post(Uri.parse(BaseConfig().baseUrl + url),
      headers: headers, body: jsonEncode(body));
}
