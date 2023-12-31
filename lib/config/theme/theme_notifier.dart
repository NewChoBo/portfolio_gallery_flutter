import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark; // 초기 값은 다크모드로 설정
  SharedPreferences? _prefs;

  ThemeNotifier() {
    _loadThemeMode();
  }

  ThemeMode get themeMode => _themeMode;

  void toggleTheme() async {
    _themeMode =
        (_themeMode == ThemeMode.light) ? ThemeMode.dark : ThemeMode.light;
    notifyListeners(); // 상태 변경 알림
    await _saveThemeMode();
  }

  Future<void> _loadThemeMode() async {
    _prefs = await SharedPreferences.getInstance();
    int themeModeIndex = _prefs?.getInt('themeMode') ?? ThemeMode.dark.index;
    _themeMode = ThemeMode.values[themeModeIndex];
    notifyListeners();
  }

  Future<void> _saveThemeMode() async {
    await _prefs?.setInt('themeMode', _themeMode.index);
  }
}
