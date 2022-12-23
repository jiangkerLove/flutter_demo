import 'dart:async';

import 'package:app_flutter/common/response_model.dart';
import 'package:get/state_manager.dart';

enum PageState {
  loading,
  loaded,
  error,
}

class BaseController<T> extends GetxController {
  PageState state = PageState.loading;
  bool isFetching = false;

  void fetchData({bool changeState = true, dynamic extra}) async {
    if (isFetching) {
      return;
    }
    isFetching = true;
    if (changeState) {
      state = PageState.loading;
      update();
    }
    var resp = await apiFetch(extra);

    isFetching = false;

    if (resp != null && resp.success && resp.code == 200 && resp.data != null) {
      onDataFetched(resp.data as T, extra);
      if (changeState) {
        state = PageState.loaded;
        update();
      }
    } else {
      if (changeState) {
        state = PageState.error;
        update();
      }
    }
  }

  Future<RespModel<T?>?> apiFetch(dynamic extra) {
    return Future.value(null);
  }

  void onDataFetched(T data, dynamic extra) {}
}
