import 'package:app_flutter/common/network.dart';
import 'package:app_flutter/common/response_model.dart';
import 'package:dio/dio.dart';

class AccomplishApi {
  static const String _accomplishUrl = "/accumulation/publish";

  static Future<RespModel<String?>?> submit(
    String habitDesc,
    int habitId,
    List<String> files,
  ) async {
    List<MultipartFile> list = [];
    for (var element in files) {
      var file = await MultipartFile.fromFile(element);
      list.add(file);
    }

    return NetWork.post<String>(
      _accomplishUrl,
      extraParams: {
        "habitDesc": habitDesc,
        "habitId": habitId,
      },
      extraBody: FormData.fromMap(
        {"files": list},
      ),
    );
  }
}
