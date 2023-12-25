import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_gallery_flutter/config/theme/theme_notifier.dart';
import 'package:portfolio_gallery_flutter/config/theme/themes.dart';
import 'package:portfolio_gallery_flutter/screen/portfolio_gallery/routes/app_router.dart';
import 'package:provider/provider.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: const App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = context.watch<ThemeNotifier>();
    final router = AppRouter.createRouter();

    return MaterialApp.router(
      title: 'Portfolio Gallery',
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      theme: customLightTheme,
      darkTheme: customDarkTheme,
      themeMode: themeNotifier.themeMode,
      routerConfig: router,
    );
  }
}
