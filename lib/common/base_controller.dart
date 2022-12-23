import 'dart:async';

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
    var data = await apiFetch(extra);

    isFetching = false;

    if (data != null) {
      onDataFetched(data, extra);
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

  Future<T?> apiFetch(dynamic extra) {
    return Future.value(null);
  }

  void onDataFetched(T data, dynamic extra) {}
}
