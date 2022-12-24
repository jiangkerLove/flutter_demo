import 'dart:convert';

import 'package:app_flutter/common/response_model.dart';
import 'package:app_flutter/http_proxy_local.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

typedef ResponseFormat<T> = T Function(Map<String, dynamic>? data);

class NetWork {
  ///创建 dio
  static Dio dio = Dio();
  static String baseUrl = "http://43.139.76.52:8081";

  static Future<RespModel<T?>?> post<T>(
    String url, {
    ResponseFormat<T>? format,
    Map<String, dynamic>? extraParams,
    dynamic extraBody,
    String? testAssert,
  }) async {
    if (testAssert != null) {
      String? load = await rootBundle.loadString(testAssert);
      Map<String, dynamic> data = jsonDecode(load);
      return RespModel(data: format?.call(data), code: 200);
    } else {
      proxyHttp(dio);

      dio.options = BaseOptions(
        headers: {
          "token":
              "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE3MDMyMjY3ODIsInVzZXJJZCI6IjE2MDU4MTM2NDQyMTg0MDA3NjkifQ.yURswxsO6G3FU5hBCJz1-QdUbT5FxT-oJ9ev8M6nzLw"
        },
      );

      Response response = await dio.post(
        "$baseUrl$url",
        data: extraBody,
        queryParameters: extraParams,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic>? data = response.data;
        return RespModel.fromJson(data, format: format);
      } else {
        return Future.value(null);
      }
    }
  }
}
