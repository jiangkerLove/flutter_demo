import 'package:app_flutter/common/base_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

enum RefreshType {
  normal,
  loadMore,
  pull,
}

mixin RefreshMixin<T> on BaseController<T> {
  bool hasMore = false;

  final RefreshController refreshController = RefreshController();

  void loadMore() {
    fetchData(changeState: false, extra: RefreshType.loadMore);
  }
}
