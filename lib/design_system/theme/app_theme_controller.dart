import 'package:flutter/material.dart';

import '../tokens/app_fonts.dart';
import '../tokens/app_themes.dart';

class AppThemeController extends ChangeNotifier {
  AppThemeId _themeId = AppThemeId.ocean;
  ThemeMode _mode = ThemeMode.system;

  AppFontId _fontId = AppFontId.inter;

  AppThemeId get themeId => _themeId;

  ThemeMode get mode => _mode;

  AppFontId get fontId => _fontId;

  void setTheme(AppThemeId id) {
    _themeId = id;
    notifyListeners();
  }

  void setMode(ThemeMode mode) {
    _mode = mode;
    notifyListeners();
  }

  void setFont(AppFontId id) {
    _fontId = id;
    notifyListeners();
  }

  ThemePair get pair => AppThemes.all[_themeId]!;
}
