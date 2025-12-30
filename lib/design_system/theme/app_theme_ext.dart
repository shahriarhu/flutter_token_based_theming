import 'package:flutter/material.dart';

import '../tokens/app_color_tokens.dart';

extension ThemeContextX on BuildContext {
  ColorScheme get scheme => Theme.of(this).colorScheme;
}

extension TokensX on BuildContext {
  AppColorTokens get tokens => AppTokensScope.of(this);
}

class AppTokensScope extends InheritedWidget {
  final AppColorTokens tokens;

  const AppTokensScope({super.key, required this.tokens, required super.child});

  static AppColorTokens of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppTokensScope>();
    assert(scope != null, 'AppTokensScope not found. Wrap your app with it.');
    return scope!.tokens;
  }

  @override
  bool updateShouldNotify(AppTokensScope oldWidget) => tokens != oldWidget.tokens;
}
