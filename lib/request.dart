import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:functions/model/error.dart';
import 'package:http/http.dart';

typedef ListResponseHandler = List<dynamic> Function(String str);

Future requestList({required String endpoint, required ListResponseHandler responseHandler, Map<String, String>? params}) async {
  var url = Uri.http('$localhostApiUrl:3000', endpoint, params);
  if (kDebugMode) {
    print(url.toString());
  }
  Response response = await get(url, headers: {"content-type": "application/json"});

  if (response.statusCode < 400) {
    return responseHandler(utf8.decode(response.bodyBytes));
  }
  throw Exception(errorFromJson(response.body).error);
}

typedef MapResponseHandler = Function(String str);

Future requestMap({required String endpoint, required MapResponseHandler responseHandler, params}) async {
  var url = Uri.http('$localhostApiUrl:3000', endpoint, params);
  Response response = await get(url, headers: {"content-type": "application/json"});

  if (response.statusCode < 400) {
    if (kDebugMode) {
      print(response.body);
    }
    return responseHandler(response.body);
  }
  throw Exception(errorFromJson(response.body).error);
}

String localhostApiUrl = 'localhost';
