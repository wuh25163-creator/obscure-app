import 'package:flutter/material.dart';
import '../screens/shared/notification_center_screen.dart';

class AppTheme {
  static bool isDesigner = false;
  static const Color primary = Color(0xFF1A1A1A);
  static const Color accentYellow = Color(0xFFFFCC00);
  static const Color accentRed = Color(0xFFE63B2E);
  static const Color accentBlue = Color(0xFF0055FF);
  static const Color accentGreen = Color(0xFF00C853);
  static const Color accentPurple = Color(0xFFAA00FF);
  static const Color background = Color(0xFFF5F0E8);
  static const Color surface = Color(0xFFFFFFFF);

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.light(
        primary: primary,
        secondary: accentYellow,
        error: accentRed,
        surface: surface,
      ),
      fontFamily: 'Roboto',
      textTheme: const TextTheme(
        displayLarge: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w900, color: primary),
        displayMedium: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w900, color: primary),
        displaySmall: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w900, color: primary),
        headlineLarge: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w800, color: primary),
        headlineMedium: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w800, color: primary),
        headlineSmall: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w800, color: primary),
        titleLarge: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w700, color: primary),
        bodyLarge: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, color: primary),
        bodyMedium: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, color: primary),
      ),
    );
  }
}

class NeoBoxDecoration extends BoxDecoration {
  const NeoBoxDecoration({
    Color color = AppTheme.surface,
    bool isAction = false,
  }) : super(
          color: color,
          border: const Border.fromBorderSide(BorderSide(color: AppTheme.primary, width: 3)),
          boxShadow: const [
            BoxShadow(
              color: AppTheme.primary,
              offset: Offset(4, 4),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
        );
}

/// A shared AppBar widget with centered, non-italic Obscure logo
/// to be used across all screens.
class ObscureAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? leading;

  const ObscureAppBar({super.key, this.actions, this.leading});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 4.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 12,
            height: 24,
            color: AppTheme.primary,
          ),
          const SizedBox(width: 4),
          Container(
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppTheme.primary, width: 2)),
            ),
            padding: const EdgeInsets.only(top: 2),
            child: const Text(
              'Obscure',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: AppTheme.primary,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
        ],
      ),
      centerTitle: true,
      backgroundColor: AppTheme.background,
      elevation: 0,
      leading: leading ??
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.primary, width: 2),
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.search, color: AppTheme.primary, size: 20),
                onPressed: () {},
              ),
            ),
          ),
      actions: actions ??
          [
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.primary, width: 2),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.notifications_none, color: AppTheme.primary, size: 20),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationCenterScreen(),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(color: AppTheme.primary, height: 4.0),
      ),
    );
  }
}
