// Author: Dean.Liu
// DateTime: 2024/10/07 15:28

/// 分页请求的状态
enum PagingRequestStatus {
  /// 初始状态
  initial,

  /// 刷新中
  refreshing,

  /// 刷新成功
  refreshSuccess,

  /// 刷新失败
  refreshFail,

  /// 加载更多中
  loading,

  /// 加载更多成功
  loadSuccess,

  /// 加载更多失败
  loadFail,
}
