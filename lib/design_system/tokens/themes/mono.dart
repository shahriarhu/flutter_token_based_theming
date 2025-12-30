import 'package:flutter/material.dart';

import '../app_color_tokens.dart';

class MonoLightTokens implements AppColorTokens {
  const MonoLightTokens();

  @override
  BrandColors get brand => const _MonoBrandLight();

  @override
  TextColors get text => const _MonoTextLight();

  @override
  SurfaceColors get surface => const _MonoSurfaceLight();

  @override
  SemanticColors get semantic => const _MonoSemanticLight();
}

class MonoDarkTokens implements AppColorTokens {
  const MonoDarkTokens();

  @override
  BrandColors get brand => const _MonoBrandDark();

  @override
  TextColors get text => const _MonoTextDark();

  @override
  SurfaceColors get surface => const _MonoSurfaceDark();

  @override
  SemanticColors get semantic => const _MonoSemanticDark();
}

class _MonoBrandLight implements BrandColors {
  const _MonoBrandLight();

  @override
  Color get primary => const Color(0xFF111827);

  @override
  Color get primaryContainer => const Color(0xFFE5E7EB);

  @override
  Color get onPrimary => Colors.white;

  @override
  Color get secondary => const Color(0xFF6B7280);

  @override
  Color get secondaryContainer => const Color(0xFFF3F4F6);

  @override
  Color get onSecondary => Colors.white;
}

class _MonoTextLight implements TextColors {
  const _MonoTextLight();

  @override
  Color get strong => const Color(0xFF111827);

  @override
  Color get body => const Color(0xFF374151);

  @override
  Color get muted => const Color(0xFF6B7280);

  @override
  Color get inverse => Colors.white;

  @override
  Color get link => const Color(0xFF111827);
}

class _MonoSurfaceLight implements SurfaceColors {
  const _MonoSurfaceLight();

  @override
  Color get background => const Color(0xFFF9FAFB);

  @override
  Color get canvas => Colors.white;

  @override
  Color get elevated => Colors.white;

  @override
  Color get border => const Color(0xFFE5E7EB);
}

class _MonoSemanticLight implements SemanticColors {
  const _MonoSemanticLight();

  @override
  Color get success => const Color(0xFF16A34A);

  @override
  Color get warning => const Color(0xFFF59E0B);

  @override
  Color get danger => const Color(0xFFDC2626);

  @override
  Color get info => const Color(0xFF6B7280);
}

class _MonoBrandDark implements BrandColors {
  const _MonoBrandDark();

  @override
  Color get primary => const Color(0xFFE5E7EB);

  @override
  Color get primaryContainer => const Color(0xFF111827);

  @override
  Color get onPrimary => const Color(0xFF111827);

  @override
  Color get secondary => const Color(0xFF9CA3AF);

  @override
  Color get secondaryContainer => const Color(0xFF1F2937);

  @override
  Color get onSecondary => const Color(0xFF111827);
}

class _MonoTextDark implements TextColors {
  const _MonoTextDark();

  @override
  Color get strong => const Color(0xFFF9FAFB);

  @override
  Color get body => const Color(0xFFD1D5DB);

  @override
  Color get muted => const Color(0xFF9CA3AF);

  @override
  Color get inverse => const Color(0xFF0B1220);

  @override
  Color get link => const Color(0xFFE5E7EB);
}

class _MonoSurfaceDark implements SurfaceColors {
  const _MonoSurfaceDark();

  @override
  Color get background => const Color(0xFF0B1220);

  @override
  Color get canvas => const Color(0xFF0F172A);

  @override
  Color get elevated => const Color(0xFF111827);

  @override
  Color get border => const Color(0xFF1F2937);
}

class _MonoSemanticDark implements SemanticColors {
  const _MonoSemanticDark();

  @override
  Color get success => const Color(0xFF22C55E);

  @override
  Color get warning => const Color(0xFFFBBF24);

  @override
  Color get danger => const Color(0xFFEF4444);

  @override
  Color get info => const Color(0xFF9CA3AF);
}
