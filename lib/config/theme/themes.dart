// themes.dart
import 'package:flutter/material.dart';

final ThemeData customLightTheme = ThemeData.light().copyWith(
    // primaryColor: Colors.teal,
    // colorScheme: ThemeData.light().colorScheme.copyWith(
    //       primary: Colors.teal,
    //       secondary: Colors.amber, // 이전의 accentColor에 해당
    //     ),
    // ... other customizations ...
    );

final ThemeData customDarkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.black,
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
    ),
  ),
);
