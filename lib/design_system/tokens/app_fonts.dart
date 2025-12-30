import 'package:google_fonts/google_fonts.dart';

import 'app_typography_tokens.dart';

enum AppFontId { inter, poppins, merriweather, jetBrainsMonoUi }

abstract final class AppFonts {
  static final map = {
    AppFontId.inter: AppTypographyTokens(
      fontFamily: GoogleFonts.inter().fontFamily!,
      fallback: const ['Roboto', 'NotoSans'],
      monoFamily: GoogleFonts.jetBrainsMono().fontFamily!,
    ),

    AppFontId.poppins: AppTypographyTokens(
      fontFamily: GoogleFonts.poppins().fontFamily!,
      fallback: const ['Roboto', 'NotoSans'],
      monoFamily: GoogleFonts.jetBrainsMono().fontFamily!,
    ),

    AppFontId.merriweather: AppTypographyTokens(
      fontFamily: GoogleFonts.merriweather().fontFamily!,
      fallback: const ['Roboto', 'NotoSans'],
      monoFamily: GoogleFonts.jetBrainsMono().fontFamily!,
    ),

    AppFontId.jetBrainsMonoUi: AppTypographyTokens(
      fontFamily: GoogleFonts.jetBrainsMono().fontFamily!,
      fallback: const ['Roboto', 'NotoSans'],
      monoFamily: GoogleFonts.jetBrainsMono().fontFamily!,
    ),
  };
}
