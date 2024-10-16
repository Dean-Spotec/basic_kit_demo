import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'paging_request_status.dart';
import 'paging_state.dart';

/// 分页请求需要返回的模型
class PagingResult<ItemType> {
  const PagingResult({
    required this.items,
    required this.hasMore,
  });

  final List<ItemType> items;
  final bool hasMore;
}

/// 刷新、加载更多通用逻辑，分页组件的provider使用时必须混入本类
mixin PagingNotifierMixin<ItemType>
    implements PagingNotifierInterface<PagingState<ItemType>, ItemType> {
  /// 分页的起始index
  final firstPage = 1;

  /// 获取分页数据
  Future<PagingResult<ItemType>> fetch({required int page});

  /// 通知header触发下拉刷新动作
  void refresh() {
    // 在刷新或加载更多
    if (state.togglePull == true) return;
    state = state.copyWith(
      status: PagingRequestStatus.refreshing,
      togglePull: true,
    );
  }

  /// 通知footer触发上拉加载动作
  void loadMore() {
    if (!state.hasMore || state.togglePull == true) return;
    state = state.copyWith(
      status: PagingRequestStatus.loading,
      togglePull: true,
    );
  }

  /// 更新状态
  void updateState(PagingState<ItemType> newState) {
    state = newState;
  }
}

/// 定义一个接口，来提供state和ref
abstract interface class PagingNotifierInterface<
    StateType extends PagingState<ItemType>, ItemType> {
  StateType get state;

  set state(StateType newState);

  AutoDisposeNotifierProviderRef<StateType> get ref;
}
