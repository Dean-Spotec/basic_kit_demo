// Author: Dean.Liu
// DateTime: 2024/09/11 18:31

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:basic_kit_demo/shared/riverpod/provider/locale_notifier_provider.dart';
import 'package:basic_kit_demo/shared/ui/style/tmd_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '/basic_kit/views/corner_banner.dart';
import '/generated/l10n.dart';
import '/route/app_router.dart';
import '/route/router_observer.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key, required this.savedThemeMode});

  /// 保存的主题模式
  final AdaptiveThemeMode? savedThemeMode;

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late final _appRouter =
      AppRouter(navigatorKey: GlobalKey<NavigatorState>(), ref: ref);

  @override
  Widget build(BuildContext context) {
    final themeApp = CupertinoAdaptiveTheme(
      light: TmdTheme.lightThemeData,
      dark: TmdTheme.darkThemeData,
      initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme) => CupertinoApp.router(
        title: 'BasicKit Demo',
        theme: theme,
        routerConfig: _appRouter.config(
          navigatorObservers: () => [
            RouterObserver(),
            // FlutterSmartDialog.observer,
          ],
        ),
        locale: ref.watch(localeNotifierProvider).currentLocale,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        builder: FlutterSmartDialog.init(
          builder: (context, child) {
            return child ?? const Placeholder();
          },
        ),
      ),
    );
    return CornerBanner(
      message: 'Demo',
      show: true,
      location: BannerLocation.topStart,
      child: themeApp,
    );
  }
}
