import 'package:app_flutter/common/network.dart';

class RespModel<T> {
  RespModel({
    this.code,
    this.message,
    this.data,
    this.exceptionClass,
    this.success = false,
  });

  RespModel.fromJson(dynamic json, {ResponseFormat<T>? format}) {
    code = json['code'];
    message = json['message'];
    var dataValue = json["data"];
    if (dataValue is Map<String, dynamic> && format != null) {
      data = format(dataValue);
    } else {
      data = dataValue;
    }
    exceptionClass = json['exceptionClass'];
    success = json['success'] ?? false;
  }

  int? code;
  String? message;
  T? data;
  String? exceptionClass;
  bool success = false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    map['data'] = data;
    map['exceptionClass'] = exceptionClass;
    map['success'] = success;
    return map;
  }

  bool valid() {
    return success && code == 200;
  }
}
