import 'package:flutter/material.dart';

import '../tokens/app_color_tokens.dart';
import '../tokens/app_typography_tokens.dart';
import 'app_color_scheme.dart';

abstract final class AppTheme {
  static ThemeData build({
    required AppColorTokens tokens,
    required AppTypographyTokens typography,
    required Brightness brightness,
  }) {
    final scheme = AppColorSchemes.fromTokens(
      token: tokens,
      brightness: brightness,
    );

    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: tokens.surface.background,
      fontFamily: typography.fontFamily,
      fontFamilyFallback: typography.fallback,
    );

    final textTheme = base.textTheme.apply(
      bodyColor: tokens.text.body,
      displayColor: tokens.text.strong,
    );

    return base.copyWith(
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: tokens.surface.canvas,
        foregroundColor: tokens.text.strong,
        elevation: 0,
        titleTextStyle: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
    );
  }
}
