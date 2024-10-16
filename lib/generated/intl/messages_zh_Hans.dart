// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_Hans locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_Hans';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "loadFailed": MessageLookupByLibrary.simpleMessage("加载失败"),
        "loadSucceeded": MessageLookupByLibrary.simpleMessage("加载成功"),
        "loading": MessageLookupByLibrary.simpleMessage("加载中..."),
        "localization": MessageLookupByLibrary.simpleMessage("本地化"),
        "noMore": MessageLookupByLibrary.simpleMessage("没有更多"),
        "pullDownToRefresh": MessageLookupByLibrary.simpleMessage("下拉刷新"),
        "pullUpToLoadMore": MessageLookupByLibrary.simpleMessage("上拉加载"),
        "refreshFailed": MessageLookupByLibrary.simpleMessage("刷新失败"),
        "refreshSucceeded": MessageLookupByLibrary.simpleMessage("刷新成功"),
        "refreshing": MessageLookupByLibrary.simpleMessage("刷新中..."),
        "releaseToLoadMore": MessageLookupByLibrary.simpleMessage("释放立即加载"),
        "releaseToRefresh": MessageLookupByLibrary.simpleMessage("释放立即刷新"),
        "save": MessageLookupByLibrary.simpleMessage("保存")
      };
}
