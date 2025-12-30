import 'package:flutter/material.dart';

import '../app_color_tokens.dart';

class OceanLightTokens implements AppColorTokens {
  const OceanLightTokens();

  @override
  BrandColors get brand => const _OceanBrandLight();

  @override
  TextColors get text => const _OceanTextLight();

  @override
  SurfaceColors get surface => const _OceanSurfaceLight();

  @override
  SemanticColors get semantic => const _OceanSemanticLight();
}

class OceanDarkTokens implements AppColorTokens {
  const OceanDarkTokens();

  @override
  BrandColors get brand => const _OceanBrandDark();

  @override
  TextColors get text => const _OceanTextDark();

  @override
  SurfaceColors get surface => const _OceanSurfaceDark();

  @override
  SemanticColors get semantic => const _OceanSemanticDark();
}

class _OceanBrandLight implements BrandColors {
  const _OceanBrandLight();

  @override
  Color get primary => const Color(0xFF2563EB);

  @override
  Color get primaryContainer => const Color(0xFFDBEAFE);

  @override
  Color get onPrimary => Colors.white;

  @override
  Color get secondary => const Color(0xFF14B8A6);

  @override
  Color get secondaryContainer => const Color(0xFFCCFBF1);

  @override
  Color get onSecondary => Colors.white;
}

class _OceanTextLight implements TextColors {
  const _OceanTextLight();

  @override
  Color get strong => const Color(0xFF0F172A);

  @override
  Color get body => const Color(0xFF334155);

  @override
  Color get muted => const Color(0xFF64748B);

  @override
  Color get inverse => Colors.white;

  @override
  Color get link => const Color(0xFF2563EB);
}

class _OceanSurfaceLight implements SurfaceColors {
  const _OceanSurfaceLight();

  @override
  Color get background => const Color(0xFFF8FAFC);

  @override
  Color get canvas => Colors.white;

  @override
  Color get elevated => Colors.white;

  @override
  Color get border => const Color(0xFFE2E8F0);
}

class _OceanSemanticLight implements SemanticColors {
  const _OceanSemanticLight();

  @override
  Color get success => const Color(0xFF16A34A);

  @override
  Color get warning => const Color(0xFFF59E0B);

  @override
  Color get danger => const Color(0xFFDC2626);

  @override
  Color get info => const Color(0xFF2563EB);
}

class _OceanBrandDark implements BrandColors {
  const _OceanBrandDark();

  @override
  Color get primary => const Color(0xFF60A5FA);

  @override
  Color get primaryContainer => const Color(0xFF0B2A4A);

  @override
  Color get onPrimary => const Color(0xFF001E2F);

  @override
  Color get secondary => const Color(0xFF2DD4BF);

  @override
  Color get secondaryContainer => const Color(0xFF0B3B36);

  @override
  Color get onSecondary => const Color(0xFF003731);
}

class _OceanTextDark implements TextColors {
  const _OceanTextDark();

  @override
  Color get strong => const Color(0xFFF8FAFC);

  @override
  Color get body => const Color(0xFFCBD5E1);

  @override
  Color get muted => const Color(0xFF94A3B8);

  @override
  Color get inverse => const Color(0xFF0B1220);

  @override
  Color get link => const Color(0xFF60A5FA);
}

class _OceanSurfaceDark implements SurfaceColors {
  const _OceanSurfaceDark();

  @override
  Color get background => const Color(0xFF0F172A);

  @override
  Color get canvas => const Color(0xFF0B1220);

  @override
  Color get elevated => const Color(0xFF111C2E);

  @override
  Color get border => const Color(0xFF334155);
}

class _OceanSemanticDark implements SemanticColors {
  const _OceanSemanticDark();

  @override
  Color get success => const Color(0xFF22C55E);

  @override
  Color get warning => const Color(0xFFFBBF24);

  @override
  Color get danger => const Color(0xFFEF4444);

  @override
  Color get info => const Color(0xFF60A5FA);
}
