// Author: Dean.Liu
// DateTime: 2024/09/12 11:14

import 'package:shared_preferences/shared_preferences.dart';

/// 简单的本地存储工具类，基于shared_preferences
class Sp {
  factory Sp() => _instance;

  Sp._internal();

  static final Sp _instance = Sp._internal();

  SharedPreferences? _spf;

  /// 初始化SharedPreferences类，异步函数
  static Future<SharedPreferences?> init({required String prefix}) async {
    SharedPreferences.setPrefix(prefix);
    final spf = await SharedPreferences.getInstance();
    return _instance._spf = spf;
  }

  /// 所有的key
  Set<String>? get keys => _spf?.getKeys();

  /// 获取存储的所有keys
  Set<String>? getKeys() {
    return _spf?.getKeys();
  }

  /// 判断shared_preferences的keys是否包含[key]
  bool containsKey(String key) {
    return _spf?.containsKey(key) ?? false;
  }

  /// 根据[key]获取字符串
  String? getString(String key) {
    return _spf?.getString(key);
  }

  /// 根据[key]存储字符串[value]
  Future<bool>? putString(String key, String? value) {
    if (value == null) {
      return _spf?.remove(key);
    }
    return _spf?.setString(key, value);
  }

  /// 根据[key]获取布尔值
  bool? getBool(String key) {
    return _spf?.getBool(key);
  }

  /// 根据[key]存储布尔值[value]
  Future<bool>? putBool(String key, bool? value) {
    if (value == null) {
      return _spf?.remove(key);
    }
    return _spf?.setBool(key, value);
  }

  /// 根据[key]获取整数
  int? getInt(String key) {
    return _spf?.getInt(key);
  }

  /// 根据[key]存储整数[value]
  Future<bool>? putInt(String key, int? value) {
    if (value == null) {
      return _spf?.remove(key);
    }
    return _spf?.setInt(key, value);
  }

  /// 根据[key]获取浮点
  double? getDouble(String key) {
    return _spf?.getDouble(key);
  }

  /// 根据[key]存储浮点数[value]
  Future<bool>? putDouble(String key, double? value) {
    if (value == null) {
      return _spf?.remove(key);
    }
    return _spf?.setDouble(key, value);
  }

  /// 根据[key]获取字符串数组
  List<String>? getStringList(String key) {
    return _spf?.getStringList(key);
  }

  /// 根据[key]存储字符串数组[value]
  Future<bool>? putStringList(String key, List<String>? value) {
    if (value == null) {
      return _spf?.remove(key);
    }
    return _spf?.setStringList(key, value);
  }

  /// 根据[key]删除存储对象
  Future<bool>? remove(String key) {
    return _spf?.remove(key);
  }

  /// 清除所有 shared_preferences 的本地存储
  Future<bool>? clear() {
    return _spf?.clear();
  }
}
