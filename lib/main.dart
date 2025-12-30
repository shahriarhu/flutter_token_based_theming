import 'package:flutter/material.dart';

import 'demo_page.dart';
import 'design_system/theme/app_theme.dart';
import 'design_system/theme/app_theme_controller.dart';
import 'design_system/theme/app_theme_ext.dart';
import 'design_system/tokens/app_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = AppThemeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        final pair = controller.pair;
        final typography = AppFonts.map[controller.fontId]!;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: controller.mode,

          theme: AppTheme.build(
            tokens: pair.light,
            typography: typography,
            brightness: Brightness.light,
          ),
          darkTheme: AppTheme.build(
            tokens: pair.dark,
            typography: typography,
            brightness: Brightness.dark,
          ),

          // Provide tokens depending on effective brightness
          builder: (context, child) {
            final brightness = Theme.of(context).brightness;
            final tokens = brightness == Brightness.dark ? pair.dark : pair.light;
            return AppTokensScope(
              tokens: tokens,
              child: child ?? const SizedBox(),
            );
          },

          home: DemoPage(controller: controller),
        );
      },
    );
  }
}
