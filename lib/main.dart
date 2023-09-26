import 'package:flutter/material.dart';
import 'package:portfolio_gallery_flutter/config/theme/themeNotifier.dart';
import 'package:portfolio_gallery_flutter/config/theme/themes.dart';
import 'package:portfolio_gallery_flutter/screen/example/webtoons/webtoons_home_futureBuillder.dart';
import 'package:provider/provider.dart';

void main() {
  //여기다 메소드 작성하면 앱 실행할 때 자동 수행될 듯
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

    return MaterialApp(
      theme: customLightTheme,
      darkTheme: customDarkTheme,
      themeMode: themeNotifier.themeMode,
      home: WebtoonsHome(),
    );
  }
}
