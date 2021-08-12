import 'dart:convert';

import 'package:flutter_application_1/model/BearItem.dart';
import 'package:http/http.dart' as http;

class HttpService {
  Future<http.Response> fetch() async {
    String url = 'http://10.53.39.148:8080/MyTestProj/index.jsp';
    Uri uri = Uri.parse(url);
    return http.get(uri);
  }

  Future<BearList> fetchBear() async {
    String url = 'http://10.53.39.148:8080/MyTestProj/index.jsp';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var statusCode = response.statusCode;
    var headers = response.headers;
    var body = json.decode(response.body);

    print('[$runtimeType] fetchBear - statusCode : $statusCode');
    print('[$runtimeType] fetchBear - headers : $headers');
    print('[$runtimeType] fetchBear - body : $body');

    if (response.statusCode == 200) {
      return BearList.fromJson(body);
    } else {
      throw Exception(' Failed to load Bear ');
    }
  }
}
