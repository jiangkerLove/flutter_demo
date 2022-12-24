import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

void proxyHttp(Dio dio) {
  // (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
  //   client.findProxy = (uri) {
  //     return "PROXY 192.168.0.118:8888";
  //   };
  // };
}
