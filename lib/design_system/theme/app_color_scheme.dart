import 'package:flutter/material.dart';

import '../tokens/app_color_tokens.dart';

abstract final class AppColorSchemes {
  static ColorScheme fromTokens({
    required AppColorTokens token,
    required Brightness brightness,
  }) {
    return ColorScheme(
      brightness: brightness,
      primary: token.brand.primary,
      onPrimary: token.brand.onPrimary,
      primaryContainer: token.brand.primaryContainer,
      onPrimaryContainer: token.text.strong,

      secondary: token.brand.secondary,
      onSecondary: token.brand.onSecondary,
      secondaryContainer: token.brand.secondaryContainer,
      onSecondaryContainer: token.text.strong,

      tertiary: token.semantic.info,
      onTertiary: token.text.inverse,
      tertiaryContainer: token.surface.elevated,
      onTertiaryContainer: token.text.strong,

      error: token.semantic.danger,
      onError: token.text.inverse,
      errorContainer: token.semantic.danger,
      onErrorContainer: token.text.inverse,

      surface: token.surface.canvas,
      onSurface: token.text.strong,
      surfaceContainerHighest: token.surface.elevated,
      onSurfaceVariant: token.text.body,

      outline: token.surface.border,
      shadow: Colors.black,

      inverseSurface: token.text.strong,
      onInverseSurface: token.text.inverse,
      inversePrimary: token.brand.primary,
    );
  }
}
