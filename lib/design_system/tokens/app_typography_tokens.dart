import 'package:flutter/material.dart';

@immutable
class AppTypographyTokens {
  final String fontFamily;

  final List<String> fallback;

  final String monoFamily;

  const AppTypographyTokens({
    required this.fontFamily,
    this.fallback = const [],
    required this.monoFamily,
  });
}
