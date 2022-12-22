import 'dart:async';

import 'package:get/state_manager.dart';

enum PageState {
  loading,
  loaded,
  error,
}

class BaseController<T> extends GetxController {
  PageState state = PageState.loading;

  void fetchData({bool changeState = true}) async {
    if (changeState) {
      state = PageState.loading;
      update();
    }
    var data = await apiFetch();
    if (data != null) {
      onDataFetched(data);
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

  Future<T?> apiFetch() {
    return Future.value(null);
  }

  void onDataFetched(T data) {}
}
