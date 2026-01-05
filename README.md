# 🎨 Flutter Design System – Token-Based ColorScheme & Typography

This project demonstrates a **production-ready Flutter design system** built around **design tokens**, **Material 3 ColorScheme**, and **runtime-switchable themes and fonts**.

It is designed to mirror **real-world Figma → Flutter workflows**, where colors and typography are defined as **semantic tokens** and mapped cleanly into Flutter’s theming system.

---

## ✨ Key Features

- ✅ **Token-based design system** (colors & typography)
- 🎨 **Multiple themes** (4+ themes supported, easily extendable)
- 🌗 **Light / Dark mode per theme**
- 🔤 **Multiple fonts (Google Fonts)** with runtime switching
- 🧱 **Material 3 (`ColorScheme`) compliant**
- 🔄 **Theme + font switching at runtime**
- 🧩 Clean separation of **design tokens**, **theme logic**, and **UI**
- 🚀 Zero hard-coded colors or fonts in UI widgets

---

## 🧠 Architecture Overview

The project follows a **Design Tokens → Theme → UI** architecture.

```text
Figma Colors & Fonts
↓
Design Tokens (Pure Dart)
↓
Material ColorScheme / ThemeData
↓
UI Widgets (context.tokens, context.scheme)
```


### Why this approach?
- Keeps UI **designer-friendly**
- Makes theme changes **safe and predictable**
- Scales to **large apps** and **white-label products**
- Matches how professional design systems are built

---

## 📁 Project Structure

```text
lib/
├─ design_system/
│ ├─ tokens/
│ │ ├─ app_color_tokens.dart # Public color token interfaces
│ │ ├─ app_themes.dart # Theme registry (4+ themes)
│ │ ├─ app_fonts.dart # Font tokens (Google Fonts)
│ │ └─ themes/
│ │ ├─ ocean.dart
│ │ ├─ forest.dart
│ │ ├─ sunset.dart
│ │ └─ mono.dart
│ │
│ ├─ theme/
│ │ ├─ app_color_scheme.dart # Token → ColorScheme
│ │ ├─ app_theme.dart # Builds ThemeData
│ │ ├─ app_theme_controller.dart # Runtime theme/font control
│ │ └─ app_theme_ext.dart # BuildContext extensions
│
├─ demo_page.dart # UI showcase of tokens & fonts
└─ main.dart # App entry point
```

---

## 🎨 Color System (Design Tokens)

Colors are **not used directly** in UI widgets.

Instead, they are defined as **semantic tokens**:

```dart
context.tokens.brand.primary
context.tokens.text.muted
context.tokens.surface.elevated
context.tokens.semantic.success
```

These tokens are then mapped to Material 3 ColorScheme using:

```dart
ColorScheme fromTokens({
  required AppColorTokens token,
  required Brightness brightness,
})
```

### Why Semantic Tokens?

- Avoids “random color usage”
- Easier Figma ↔ Flutter alignment
- Safer refactors
- Better accessibility control


## 🔤 Typography System (Google Fonts)

#### The project uses the google_fonts package instead of bundled font assets.
#### Fonts are treated as tokens, just like colors.

#### Supported font switching at runtime:
- Inter
- Poppins
- Merriweather
- JetBrains Mono (UI or code-style)

### Font tokens example:

```dart
AppTypographyTokens(
  fontFamily: GoogleFonts.inter().fontFamily!,
  fallback: const ['Roboto', 'NotoSans'],
  monoFamily: GoogleFonts.jetBrainsMono().fontFamily!,
)
```
Fonts are applied globally via ThemeData, so no manual fontFamily usage in UI.

## 🔄 Runtime Theme & Font Switching

#### Themes and fonts can be changed without restarting the app.

- Theme switching: Ocean / Forest / Sunset / Mono
- Mode switching: Light / Dark / System
- Font switching: Any registered font

All changes propagate automatically via a centralized controller.

## 🧪 Demo Page

#### The demo page showcases:

- Typography hierarchy
- Brand & semantic colors
- Buttons, chips, inputs
- Lists, states, badges
- Dialogs & bottom sheets
- Live theme + font switching

This page acts as a visual validation tool for your design system.

```text
flutter pub get
flutter run
```

```yaml
dependencies:
google_fonts: ^6.1.0
```

## 🏗️ Intended Use Cases

#### This setup is ideal for:

- Large Flutter applications
- Design-driven products
- White-label apps
- Multi-brand platforms
- Apps with evolving design systems
- Teams working closely with Figma

## 📌 Design Philosophy

- Tokens over constants.
- Semantics over hex values.
- Themes over hard-coding.

**This project prioritizes clarity, scalability, and maintainability over shortcuts.**


## 📄 License

- This project is for learning and demonstration purposes.
- You are free to adapt the architecture for your own applications.


## 🙌 Author

- Built to demonstrate a professional Flutter theming architecture that mirrors real-world product development.