// Author: Dean.Liu
// DateTime: 2024/10/09 18:43

import 'package:basic_kit_demo/basic_kit/core/optional.dart';
import 'package:basic_kit_demo/basic_kit/views/refresher/paging_request_status.dart';
import 'package:equatable/equatable.dart';

class PagingState<ItemType> extends Equatable {
  const PagingState({
    required this.page,
    this.items = const [],
    this.hasMore = false,
    this.status = PagingRequestStatus.initial,
    this.oldStatus = PagingRequestStatus.initial,
    this.togglePull = false,
    this.error,
  });

  /// 当前分页
  final int page;

  /// 列表数据
  final List<ItemType> items;

  /// 是否有更多数据
  final bool hasMore;

  /// 当前请求状态
  final PagingRequestStatus status;

  /// 上次请求的状态
  final PagingRequestStatus oldStatus;

  /// 是否触发header的上拉刷新，footer的下拉加载动作
  final bool togglePull;

  /// 请求失败的报错
  final Object? error;

  const PagingState.initial({required this.page})
      : items = const [],
        hasMore = false,
        status = PagingRequestStatus.initial,
        oldStatus = PagingRequestStatus.initial,
        togglePull = false,
        error = null;

  PagingState<ItemType> copyWith({
    List<ItemType>? items,
    int? page,
    bool? hasMore,
    PagingRequestStatus? status,
    bool? togglePull,
    Optional<Object>? error,
  }) {
    return PagingState<ItemType>(
      items: items ?? this.items,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      status: status ?? this.status,
      togglePull: togglePull ?? this.togglePull,
      error: error == null ? this.error : error.orNull,
      // 状态发生改变时，才更新oldStatus为当前的status
      oldStatus:
          (status == null || status == this.status) ? oldStatus : this.status,
    );
  }

  @override
  List<Object?> get props =>
      [items, page, hasMore, status, oldStatus, togglePull, error];
}
