import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

typedef ResponseFormat<T> = T? Function(Map<String, dynamic>? data);

class NetWork {
  ///创建 dio
  static Dio dio = Dio();
  static String baseUrl = "";

  static Future<T?> post<T>(
    String url,
    ResponseFormat<T> format, {
    Map<String, dynamic>? extraParams,
    String? testAssert,
  }) async {
    if (testAssert != null) {
      String? load = await rootBundle.loadString(testAssert);
      Map<String, dynamic> data = jsonDecode(load);

      return format(data);
    } else {
      Map<String, dynamic> params = Map.from(extraParams ?? {});

      dio.options = BaseOptions(headers: {"token": ""});

      Response response = await dio.post("$baseUrl$url", queryParameters: params);
      if (response.statusCode == 200) {
        Map<String, dynamic>? data = response.data;
        return format(data);
      } else {
        return Future.value(null);
      }
    }
  }
}
