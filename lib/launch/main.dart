import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../basic_kit/storage/sp.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Sp.init(prefix: 'ba');
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  final myApp = ProviderScope(
    child: MyApp(
      savedThemeMode: savedThemeMode,
    ),
  );
  runApp(myApp);
}
