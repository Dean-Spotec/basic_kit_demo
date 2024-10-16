// Author: Dean.Liu
// DateTime: 2024/10/08 11:06

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/optional.dart';
import 'paging_notifier_mixin.dart';
import 'paging_request_status.dart';
import 'paging_state.dart';

/// 分页加载组件子视图
typedef PagingChildBuilder<ItemType> = Widget Function(
  BuildContext context,
  WidgetRef ref,
  List<ItemType> items,
);

/// 基础刷新、分页加载组件
class SpPagingScroll<ItemType> extends ConsumerStatefulWidget {
  const SpPagingScroll({
    super.key,
    required this.provider,
    required this.notifier,
    required this.childBuilder,
    this.refreshController,
    this.scrollController,
    this.firstRefresh = true,
    this.enableRefresh = true,
    this.enableLoadMore = false,
    this.header,
    this.footer,
    this.netErrorView,
    this.loadingView,
    this.noDataView,
    this.refreshFailView,
    this.useSafeArea = true,
    this.onRequestError,
  });

  final ProviderListenable<PagingState<ItemType>> provider;

  final Refreshable<PagingNotifierMixin<ItemType>> notifier;

  /// 子视图构建器，必须是sliver类型的可滚动组件
  final PagingChildBuilder<ItemType> childBuilder;

  /// 刷新控制器
  final EasyRefreshController? refreshController;

  /// 滚动控制器，也必须设置给childBuilder返回的可滚动组件
  final ScrollController? scrollController;

  /// 首次刷新。创建时自动请求接口
  final bool firstRefresh;

  /// 是否可以刷新
  final bool enableRefresh;

  /// 是否可以上拉加载更多
  final bool enableLoadMore;

  /// 头部控件
  final Header? header;

  /// 尾部控件
  final Footer? footer;

  /// 请求中的loading转圈
  final Widget? loadingView;

  /// 网络无连接的占位图
  final Widget? netErrorView;

  /// 刷新成功，且没有数据的占位图
  final Widget? noDataView;

  /// 刷新失败，且没有数据的占位图
  final Widget? refreshFailView;

  /// 是否用SafeArea包裹Refresher
  final bool useSafeArea;

  /// 请求失败时的回调
  final ValueChanged<Object>? onRequestError;

  @override
  ConsumerState createState() => _SpPagingScrollState<ItemType>();
}

class _SpPagingScrollState<ItemType>
    extends ConsumerState<SpPagingScroll<ItemType>> {
  PagingNotifierMixin<ItemType> get _notifier => ref.read(widget.notifier);

  late final _refreshController = widget.refreshController ??
      EasyRefreshController(
        controlFinishRefresh: true,
        controlFinishLoad: true,
      );

  bool get _isNetConnected => true;

  /// 是否可以刷新
  bool get _enableRefresh => widget.enableRefresh && _isNetConnected;

  /// 是否可以加载更多
  bool get _enableLoadMore => widget.enableLoadMore && _isNetConnected;

  @override
  void dispose() {
    if (widget.refreshController == null) {
      _refreshController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<PagingState<ItemType>>(widget.provider, (preState, newState) {
      _togglePullAction(preState, newState);
      _finishHeaderFooterAnimate(preState, newState);
      _handleRequestError(preState, newState);
    });
    final state = ref.watch(widget.provider);
    return SafeArea(
      top: widget.useSafeArea,
      child: EasyRefresh(
        onRefresh: _enableRefresh ? _onRefresh : null,
        onLoad: _enableLoadMore ? _onLoad : null,
        controller: _refreshController,
        scrollController: widget.scrollController,
        header: _buildHeader(),
        footer: _buildFooter(),
        simultaneously: false,
        canRefreshAfterNoMore: true,
        // status为initial表示还未初始化provider，如果provider在其他页面触发过有数据，则进入时不调用刷新
        refreshOnStart: state.status == PagingRequestStatus.initial,
        refreshOnStartHeader: _buildRefreshOnStartHeader(),
        child: _buildChildScrollView(state),
      ),
    );
  }

  Widget _buildChildScrollView(PagingState state) {
    final emptyWidget = buildEmptyView(state);
    if (emptyWidget == null) {
      final value = ref.watch(widget.provider);
      return widget.childBuilder(context, ref, value.items);
    } else {
      return CustomScrollView(
        slivers: [SliverFillRemaining(child: emptyWidget)],
      );
    }
  }

  Header _buildHeader() {
    return widget.header ?? EasyRefresh.defaultHeaderBuilder();
  }

  Footer _buildFooter() {
    return widget.footer ?? EasyRefresh.defaultFooterBuilder();
  }

  /// 首次加载时的loading视图
  Header? _buildRefreshOnStartHeader() {
    if (widget.loadingView == null) {
      return null;
    }
    return BuilderHeader(
      triggerOffset: 70,
      clamping: true,
      position: IndicatorPosition.above,
      processedDuration: Duration.zero,
      builder: (ctx, state) {
        if (state.mode == IndicatorMode.inactive ||
            state.mode == IndicatorMode.done) {
          return const SizedBox();
        }
        return SizedBox(
          width: state.axis == Axis.vertical
              ? double.infinity
              : state.viewportDimension,
          height: state.axis == Axis.horizontal
              ? double.infinity
              : state.viewportDimension,
          child: widget.loadingView,
        );
      },
    );
  }

  /// 列表数据为空数组时，显示占位图
  Widget? buildEmptyView(PagingState state) {
    if (state.items.isNotEmpty) return null;
    if (!_isNetConnected) {
      return widget.netErrorView;
    }
    switch (state.status) {
      case PagingRequestStatus.refreshing:
        if (state.oldStatus == PagingRequestStatus.refreshFail) {
          return widget.refreshFailView;
        }
        if (state.oldStatus == PagingRequestStatus.refreshSuccess) {
          return widget.noDataView;
        }
        return null;
      case PagingRequestStatus.refreshFail:
        return widget.refreshFailView;
      case PagingRequestStatus.refreshSuccess:
        return widget.noDataView;
      default:
        return null;
    }
  }

  /// 触发header、footer的刷新动作
  void _togglePullAction(PagingState? preState, PagingState newState) {
    if (preState == null) return;
    if (!preState.togglePull && newState.togglePull) {
      if (newState.status == PagingRequestStatus.refreshing) {
        _refreshController.callRefresh();
      }
      if (newState.status == PagingRequestStatus.loading) {
        _refreshController.callLoad();
      }
    }
  }

  /// 结束刷新、加载动画
  void _finishHeaderFooterAnimate(PagingState? preState, PagingState newState) {
    if (preState?.status == newState.status) return;
    switch (newState.status) {
      case PagingRequestStatus.refreshSuccess:
        if (_refreshController.headerState?.mode == IndicatorMode.inactive) {
          PrimaryScrollController.of(context).jumpTo(0);
        }
        _refreshController.finishRefresh();
        _refreshController.resetFooter();
        if (!newState.hasMore) {
          Future(() => _refreshController.finishLoad(IndicatorResult.noMore));
        }
        break;
      case PagingRequestStatus.refreshFail:
        _refreshController.finishRefresh(IndicatorResult.fail);
        if (!newState.hasMore) {
          Future(() => _refreshController.finishLoad(IndicatorResult.noMore));
        }
        break;
      case PagingRequestStatus.loadSuccess:
        _refreshController.finishLoad(
          newState.hasMore ? IndicatorResult.success : IndicatorResult.noMore,
        );
        break;
      case PagingRequestStatus.loadFail:
        _refreshController.finishLoad(IndicatorResult.fail);
        break;
      default:
        break;
    }
  }

  /// 处理请求错误
  void _handleRequestError(PagingState? preState, PagingState newState) {
    if (preState?.error == null && newState.error != null) {
      widget.onRequestError?.call(newState.error!);
    }
  }

  /// 给分页组件提供的方法，不能在业务代码中调用
  Future<void> _onRefresh() async {
    _notifier.state = _notifier.state.copyWith(
      status: PagingRequestStatus.refreshing,
      error: const Optional.absent(),
    );
    try {
      final result = await _notifier.fetch(page: _notifier.firstPage);
      if (!mounted) return;
      _notifier.state = _notifier.state.copyWith(
        items: result.items,
        page: _notifier.firstPage,
        hasMore: result.hasMore,
        status: PagingRequestStatus.refreshSuccess,
        togglePull: false,
      );
    } catch (error) {
      if (!mounted) return;
      _notifier.state = _notifier.state.copyWith(
        status: PagingRequestStatus.refreshFail,
        hasMore: false,
        error: Optional.of(error),
        togglePull: false,
      );
    }
  }

  /// 给分页组件提供的方法，不能在业务代码中调用
  Future<void> _onLoad() async {
    _notifier.state = _notifier.state.copyWith(
      status: PagingRequestStatus.loading,
      error: const Optional.absent(),
    );
    try {
      final nextPage = _notifier.state.page + 1;
      final result = await _notifier.fetch(page: nextPage);
      if (!mounted) return;
      _notifier.state = _notifier.state.copyWith(
        items: [..._notifier.state.items, ...result.items],
        page: nextPage,
        hasMore: result.hasMore,
        status: PagingRequestStatus.loadSuccess,
        togglePull: false,
      );
    } catch (error) {
      if (!mounted) return;
      _notifier.state = _notifier.state.copyWith(
        status: PagingRequestStatus.loadFail,
        error: Optional.of(error),
        togglePull: false,
      );
    }
  }
}
