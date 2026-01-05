import 'package:flutter/material.dart';

import 'design_system/theme/app_theme_controller.dart';
import 'design_system/theme/app_theme_ext.dart';
import 'design_system/tokens/app_fonts.dart';
import 'design_system/tokens/app_themes.dart';

class DemoPage extends StatelessWidget {
  final AppThemeController controller;

  const DemoPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    final scheme = context.scheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Token Based Theming', style: text.titleLarge),
        actions: [
          IconButton(
            tooltip: 'Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Hello! This snackbar uses your theme + font.',
                    style: text.bodyMedium!.copyWith(color: tokens.brand.onPrimary),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.notifications_active_outlined),
          ),
          PopupMenuButton<ThemeMode>(
            tooltip: 'Theme mode',
            onSelected: controller.setMode,
            itemBuilder: (_) => const [
              PopupMenuItem(value: ThemeMode.system, child: Text('System')),
              PopupMenuItem(value: ThemeMode.light, child: Text('Light')),
              PopupMenuItem(value: ThemeMode.dark, child: Text('Dark')),
            ],
            icon: const Icon(Icons.brightness_6_outlined),
          ),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ---------- HERO ----------
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.primaryContainer,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: tokens.surface.border),
            ),
            child: Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(color: scheme.primary, borderRadius: BorderRadius.circular(14)),
                  child: Icon(Icons.palette_outlined, color: scheme.onPrimary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tokens + Theme + Fonts',
                        style: text.titleMedium?.copyWith(color: scheme.onPrimaryContainer),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'This page shows how your Figma colors + typography behave across widgets.',
                        style: text.bodyMedium?.copyWith(color: tokens.text.body),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          // ---------- THEME PICKERS ----------
          _SectionTitle(
            title: 'Theme & Font Switchers',
            subtitle: 'Switch themes and fonts to validate your design system.',
          ),
          const SizedBox(height: 10),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ...AppThemeId.values.map((id) {
                return ChoiceChip(
                  label: Text(id.name),
                  selected: controller.themeId == id,
                  onSelected: (_) => controller.setTheme(id),
                );
              }),
            ],
          ),

          const SizedBox(height: 10),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ...AppFontId.values.map((id) {
                return ChoiceChip(
                  label: Text(id.name),
                  selected: controller.fontId == id,
                  onSelected: (_) => controller.setFont(id),
                );
              }),
            ],
          ),

          const SizedBox(height: 22),

          // ---------- TYPOGRAPHY ----------
          _SectionTitle(
            title: 'Typography Preview',
            subtitle: 'Your selected font should reflect here without manual fontFamily.',
          ),
          const SizedBox(height: 12),

          _Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Display Large', style: text.displaySmall?.copyWith(color: tokens.text.strong)),
                const SizedBox(height: 6),
                Text('Title Large', style: text.titleLarge?.copyWith(color: tokens.text.strong)),
                const SizedBox(height: 6),
                Text(
                  'Body Medium — readable paragraph sample.',
                  style: text.bodyMedium?.copyWith(color: tokens.text.body),
                ),
                const SizedBox(height: 6),
                Text(
                  'Muted text for hints & secondary info.',
                  style: text.bodySmall?.copyWith(color: tokens.text.muted),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Link color',
                      style: text.bodyMedium?.copyWith(color: tokens.text.link, decoration: TextDecoration.underline),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: tokens.surface.elevated,
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(color: tokens.surface.border),
                      ),
                      child: Text('Badge', style: text.labelMedium?.copyWith(color: tokens.text.body)),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // ---------- COLOR SWATCHES ----------
          _SectionTitle(
            title: 'Color Swatches',
            subtitle: 'Quick validation of brand, surfaces, text, and semantic colors.',
          ),
          const SizedBox(height: 12),

          _Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SwatchRow(
                  title: 'Brand',
                  swatches: [
                    _Swatch(color: tokens.brand.primary, label: 'primary'),
                    _Swatch(color: tokens.brand.secondary, label: 'secondary'),
                    _Swatch(color: tokens.brand.primaryContainer, label: 'primaryContainer'),
                    _Swatch(color: tokens.brand.secondaryContainer, label: 'secondaryContainer'),
                  ],
                ),
                const SizedBox(height: 12),
                _SwatchRow(
                  title: 'Semantic',
                  swatches: [
                    _Swatch(color: tokens.semantic.success, label: 'success'),
                    _Swatch(color: tokens.semantic.warning, label: 'warning'),
                    _Swatch(color: tokens.semantic.danger, label: 'danger'),
                    _Swatch(color: tokens.semantic.info, label: 'info'),
                  ],
                ),
                const SizedBox(height: 12),
                _SwatchRow(
                  title: 'Surface',
                  swatches: [
                    _Swatch(color: tokens.surface.surface, label: 'surface'),
                    _Swatch(color: tokens.surface.elevated, label: 'elevated'),
                    _Swatch(color: tokens.surface.border, label: 'border'),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // ---------- BUTTONS / CHIPS ----------
          _SectionTitle(
            title: 'Buttons & Chips',
            subtitle: 'Check contrast, container colors, and text color behavior.',
          ),
          const SizedBox(height: 12),

          _Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.flash_on_outlined),
                      label: const Text('Primary'),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.tune_outlined),
                      label: const Text('Outlined'),
                    ),
                    TextButton.icon(onPressed: () {}, icon: const Icon(Icons.link), label: const Text('Text')),
                  ],
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 10,
                  children: const [
                    Chip(label: Text('Chip')),
                    Chip(label: Text('Tag')),
                    Chip(label: Text('Filter')),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // ---------- FORMS ----------
          _SectionTitle(title: 'Inputs / Forms', subtitle: 'Validate fill, border, focus color, hint/muted styles.'),
          const SizedBox(height: 12),

          _Card(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'example@mail.com',
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: '••••••••',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: const Icon(Icons.visibility_off_outlined),
                  ),
                  obscureText: true,
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // ---------- LIST / STATES ----------
          _SectionTitle(title: 'List Items + States', subtitle: 'Success/Warning/Danger badges + progress + toggles.'),
          const SizedBox(height: 12),

          _Card(
            child: Column(
              children: [
                _ListRow(
                  icon: Icons.check_circle_outline,
                  title: 'Payment received',
                  subtitle: 'Status: success',
                  badgeColor: tokens.semantic.success,
                  badgeText: 'SUCCESS',
                ),
                const Divider(height: 22),
                _ListRow(
                  icon: Icons.warning_amber_outlined,
                  title: 'Subscription expiring',
                  subtitle: 'Status: warning',
                  badgeColor: tokens.semantic.warning,
                  badgeText: 'WARNING',
                ),
                const Divider(height: 22),
                _ListRow(
                  icon: Icons.error_outline,
                  title: 'Action required',
                  subtitle: 'Status: danger',
                  badgeColor: tokens.semantic.danger,
                  badgeText: 'DANGER',
                ),
                const SizedBox(height: 14),
                LinearProgressIndicator(value: 0.65, backgroundColor: tokens.surface.border),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text('Enable notifications', style: text.bodyMedium?.copyWith(color: tokens.text.body)),
                    ),
                    Switch(value: true, onChanged: (_) {}),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 22),

          // ---------- DIALOG / BOTTOM SHEET ----------
          _SectionTitle(title: 'Overlays', subtitle: 'Dialog + BottomSheet using your theme colors and fonts.'),
          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(onPressed: () => _showDemoDialog(context), child: const Text('Show Dialog')),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => _showDemoBottomSheet(context),
                  child: const Text('Show Bottom Sheet'),
                ),
              ),
            ],
          ),

          const SizedBox(height: 28),
        ],
      ),
    );
  }

  void _showDemoDialog(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;

    showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Dialog title', style: text.titleLarge?.copyWith(color: t.text.strong)),
        content: Text(
          'This dialog inherits your theme + font. Check text colors and surfaces.',
          style: text.bodyMedium?.copyWith(color: t.text.body),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Confirm')),
        ],
      ),
    );
  }

  void _showDemoBottomSheet(BuildContext context) {
    final t = context.tokens;
    final s = context.scheme;
    final text = Theme.of(context).textTheme;

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: t.surface.surface,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Quick Actions', style: text.titleLarge?.copyWith(color: t.text.strong)),
              const SizedBox(height: 10),
              _ActionTile(
                icon: Icons.share_outlined,
                title: 'Share',
                subtitle: 'Uses text/body and surface colors',
                iconColor: s.primary,
              ),
              _ActionTile(
                icon: Icons.bookmark_border,
                title: 'Save',
                subtitle: 'Stored for later',
                iconColor: t.semantic.info,
              ),
              _ActionTile(
                icon: Icons.delete_outline,
                title: 'Delete',
                subtitle: 'Danger action',
                iconColor: t.semantic.danger,
              ),
              const SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}

/// ---------- Small UI helpers (keep clean) ----------

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: text.titleMedium?.copyWith(color: t.text.strong, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 4),
        Text(subtitle, style: text.bodySmall?.copyWith(color: t.text.muted)),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  final Widget child;

  const _Card({required this.child});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: t.surface.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: t.surface.border),
        boxShadow: [
          BoxShadow(
            blurRadius: 18,
            spreadRadius: 0,
            offset: const Offset(0, 8),
            color: Colors.black.withValues(alpha: 0.08),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _SwatchRow extends StatelessWidget {
  final String title;
  final List<_Swatch> swatches;

  const _SwatchRow({required this.title, required this.swatches});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: text.labelLarge?.copyWith(color: t.text.strong, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        Wrap(spacing: 10, runSpacing: 10, children: swatches),
      ],
    );
  }
}

class _Swatch extends StatelessWidget {
  final Color color;
  final String label;

  const _Swatch({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;

    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: t.surface.elevated,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: t.surface.border),
      ),
      child: Row(
        children: [
          Container(
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: t.surface.border),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: text.bodySmall?.copyWith(color: t.text.body),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _ListRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color badgeColor;
  final String badgeText;

  const _ListRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.badgeColor,
    required this.badgeText,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;

    return Row(
      children: [
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: t.surface.elevated,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: t.surface.border),
          ),
          child: Icon(icon, color: badgeColor),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: text.titleMedium?.copyWith(color: t.text.strong)),
              const SizedBox(height: 2),
              Text(subtitle, style: text.bodySmall?.copyWith(color: t.text.muted)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: badgeColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: badgeColor.withValues(alpha: 0.35)),
          ),
          child: Text(
            badgeText,
            style: text.labelSmall?.copyWith(color: badgeColor, fontWeight: FontWeight.w700, letterSpacing: 0.4),
          ),
        ),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  const _ActionTile({required this.icon, required this.title, required this.subtitle, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final text = Theme.of(context).textTheme;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: t.surface.elevated,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: t.surface.border),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: text.titleMedium?.copyWith(color: t.text.strong)),
      subtitle: Text(subtitle, style: text.bodySmall?.copyWith(color: t.text.muted)),
      trailing: Icon(Icons.chevron_right, color: t.text.muted),
      onTap: () => Navigator.pop(context),
    );
  }
}
