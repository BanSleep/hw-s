import 'dart:convert';
import 'dart:developer';

import 'package:eticon_api/eticon_api.dart';
import 'package:http/http.dart' as http;
class WeatherApi {
  static const String WEATHER_URL_DOMAIN = 'http://api.openweathermap.org/data/2.5/forecast/daily?q=London&';
  Future<Map<String, dynamic>> getRequest(
      {required String method, bool isAuth = false, bool testMode = false, Map<
          String,
          dynamic>? query}) async {
    List<String> _queryList = [];
    if (query != null) {
      query.forEach((key, value) {
        if (value is List) {
          for (var el in value)
            _queryList.add('$key = $el');
        } else
          _queryList.add('$key = $value');
      });
    }
    if (testMode) log(_queryList.toString(), name: 'API TEST GET: Query List');
    Uri url = Uri.parse(
        WEATHER_URL_DOMAIN + '$method?${_queryList.join(("&"))}');
    if (testMode) log(_queryList.toString(), name: 'API TEST GET: URL');
    var response = await http.get(url);
    if(response.statusCode != 200) {
      throw APIException(0);
    }
    var responseParams = json.decode(response.body);
    if(responseParams is! Map) {
      if(testMode) {
        log('Response body is not a Map');
      }
      Map<String, dynamic> res = {'key' : responseParams};
      return res;
    }else return Map<String, dynamic>.from(responseParams);
  }
}
