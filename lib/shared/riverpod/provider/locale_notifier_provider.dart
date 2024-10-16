// Author: Dean.Liu
// DateTime: 2024/10/15 18:07

import 'dart:io';

import 'package:basic_kit_demo/shared/const/sp_keys.dart';
import 'package:basic_kit_demo/shared/riverpod/state/locale_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../basic_kit/storage/sp.dart';

part 'locale_notifier_provider.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  LocaleState build() {
    var localCode = Sp().getString(SpKeys.localeCodeKey);
    final deviceCode = Platform.localeName;
    if (localCode == null) {
      localCode = deviceCode;
      Sp().putString(SpKeys.localeCodeKey, deviceCode);
    }
    return LocaleState(currentCode: localCode);
  }

  void switchLocale(String? code) {
    if (code == null || code == state.currentCode) return;
    Sp().putString(SpKeys.localeCodeKey, code);
    state = state.copyWith(currentCode: code);
  }
}
