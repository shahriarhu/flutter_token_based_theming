import 'package:flutter/foundation.dart';

import 'app_color_tokens.dart';
import 'themes/forest.dart';
import 'themes/mono.dart';
import 'themes/ocean.dart';
import 'themes/sunset.dart';

enum AppThemeId { ocean, forest, sunset, mono }

@immutable
class ThemePair {
  final AppColorTokens light;
  final AppColorTokens dark;

  const ThemePair({required this.light, required this.dark});
}

abstract final class AppThemes {
  static const Map<AppThemeId, ThemePair> all = {
    AppThemeId.ocean: ThemePair(
      light: OceanLightTokens(),
      dark: OceanDarkTokens(),
    ),
    AppThemeId.forest: ThemePair(
      light: ForestLightTokens(),
      dark: ForestDarkTokens(),
    ),
    AppThemeId.sunset: ThemePair(
      light: SunsetLightTokens(),
      dark: SunsetDarkTokens(),
    ),
    AppThemeId.mono: ThemePair(
      light: MonoLightTokens(),
      dark: MonoDarkTokens(),
    ),
  };
}
