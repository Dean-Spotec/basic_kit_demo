// Author: Dean.Liu
// DateTime: 2024/10/11 21:17

import 'package:flutter/cupertino.dart';

import '../../../../../basic_kit/views/refresher/sp_paging_scroll.dart';
import '../../dialog/hud/hud.dart';
import '../../placeholder/request_fail_view.dart';
import '../../placeholder/request_loading_view.dart';
import '../../placeholder/request_no_data_view.dart';

class BaPagingScroll<ItemType> extends SpPagingScroll<ItemType> {
  BaPagingScroll({
    super.key,
    required super.provider,
    required super.notifier,
    required super.childBuilder,
    super.refreshController,
    super.scrollController,
    super.firstRefresh = true,
    super.enableRefresh = true,
    super.enableLoadMore = false,
    super.header,
    super.footer,
    super.useSafeArea = true,
    super.netErrorView,
    Widget? loadingView,
    Widget? noDataView,
    Widget? refreshFailView,
    ValueChanged<Object>? onRequestError,
  }) : super(
          loadingView: loadingView ?? const RequestLoadingView(),
          noDataView: noDataView ?? const RequestNoDataView(),
          refreshFailView: refreshFailView ??
              RequestFailView(
                onRetry: (ref) => ref.read(notifier).refresh(),
              ),
          onRequestError: onRequestError ??
              (error) {
                Hud().showError(error.toString());
              },
        );
}
