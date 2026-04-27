import 'package:flutter/material.dart';
import 'app_icons.dart';
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

  // Shared layout constants — tuned for 390px mobile screen
  static const double navBarHeight = 56.0;
  static const double navBarBottomPadding = 12.0;
  static const double navIconSize = 22.0;
  static const double navActiveSize = 36.0;
  static const double navInactiveSize = 30.0;

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
          border: const Border.fromBorderSide(BorderSide(color: AppTheme.primary, width: 2)),
          boxShadow: const [
            BoxShadow(
              color: AppTheme.primary,
              offset: Offset(3, 3),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
        );
}

/// Shared bottom navigation bar used across all main screens.
class ObscureNavBar extends StatelessWidget {
  final BuildContext pageContext;
  final String activeRoute;

  const ObscureNavBar({super.key, required this.pageContext, required this.activeRoute});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('home', AppTheme.isDesigner ? '/daily_planner' : '/discovery_feed'),
      ('search', '/search_categories'),
      ('shining', '/commission_status'),
      ('chat', '/message_inbox'),
      ('user', '/designer_profile'),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: AppTheme.navBarBottomPadding, top: 4),
        child: Container(
          height: AppTheme.navBarHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AppTheme.primary, width: 2.5),
            boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(3, 3))],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items.map((item) {
              final isActive = item.$2 == activeRoute;
              return GestureDetector(
                onTap: () {
                  if (!isActive) Navigator.pushReplacementNamed(pageContext, item.$2);
                },
                child: Container(
                  width: isActive ? AppTheme.navActiveSize : AppTheme.navInactiveSize,
                  height: isActive ? AppTheme.navActiveSize : AppTheme.navInactiveSize,
                  decoration: BoxDecoration(
                    color: isActive ? AppTheme.accentYellow : Colors.white,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: AppIcons.fromName(item.$1, color: AppTheme.primary, size: AppTheme.navIconSize, isActive: isActive),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

/// A shared AppBar widget with centered Obscure logo.
class ObscureAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? leading;

  const ObscureAppBar({super.key, this.actions, this.leading});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 20,
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
                fontSize: 18,
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
            padding: const EdgeInsets.only(left: 12.0),
            child: IconButton(
              icon: AppIcons.equal(color: AppTheme.primary, size: 22),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
            ),
          ),
      actions: actions ??
          [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                icon: AppIcons.notification(color: AppTheme.primary, size: 22),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
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
          ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(3.0),
        child: Container(color: AppTheme.primary, height: 3.0),
      ),
    );
  }
}
