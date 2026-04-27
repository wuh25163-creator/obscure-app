import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'core/app_theme.dart';
import 'core/fade_slide_route.dart';
import 'screens/shared/identity_selection_screen.dart';
import 'screens/customer/customer_signup_screen.dart';
import 'screens/designer/daily_planner_screen.dart';
import 'screens/designer/designer_profile_screen.dart';
import 'screens/designer/designer_signup_screen.dart';
import 'screens/customer/discovery_feed_screen.dart';
import 'screens/shared/commission_status_screen.dart';
import 'screens/designer/income_dashboard_screen.dart';
import 'screens/shared/message_inbox_screen.dart';
import 'screens/designer/portfolio_management_screen.dart';
import 'screens/customer/search_categories_screen.dart';
import 'screens/shared/login_verification_screen.dart';
import 'screens/shared/notification_center_screen.dart';
import 'screens/shared/project_detail_screen.dart';
import 'screens/shared/contract_quote_screen.dart';
import 'screens/shared/review_rating_screen.dart';
import 'screens/admin/admin_dashboard_screen.dart';
import 'screens/designer/new_work_screen.dart';

void main() {
  runApp(const StitchApp());
}

class StitchApp extends StatelessWidget {
  const StitchApp({super.key});

  static final Map<String, WidgetBuilder> _screens = {
    '/': (context) => const LoginVerificationScreen(),
    '/identity_selection': (context) => const IdentitySelectionScreen(),
    '/customer_signup': (context) => const CustomerSignupScreen(),
    '/daily_planner': (context) => const DailyPlannerScreen(),
    '/designer_profile': (context) => const DesignerProfileScreen(),
    '/designer_signup': (context) => const DesignerSignupScreen(),
    '/discovery_feed': (context) => const DiscoveryFeedScreen(),
    '/commission_status': (context) => const CommissionStatusScreen(),
    '/income_dashboard': (context) => const IncomeDashboardScreen(),
    '/message_inbox': (context) => const MessageInboxScreen(),
    '/portfolio_management': (context) => const PortfolioManagementScreen(),
    '/search_categories': (context) => const SearchCategoriesScreen(),
    '/notifications': (context) => const NotificationCenterScreen(),
    '/project_detail': (context) => const ProjectDetailScreen(),
    '/contract_quote': (context) => const ContractQuoteScreen(),
    '/review_rating': (context) => const ReviewRatingScreen(),
    '/admin_dashboard': (context) => const AdminDashboardScreen(),
    '/new_work': (context) => const NewWorkScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OBSCURE',
      theme: AppTheme.lightTheme,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final builder = _screens[settings.name];
        if (builder != null) {
          return FadeSlideRoute(page: Builder(builder: builder));
        }
        return FadeSlideRoute(page: const LoginVerificationScreen());
      },
      builder: (context, child) {
        return Container(
          color: AppTheme.primary, // 當螢幕太寬時，兩側顯示黑色
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480), // 強制符合手機尺寸
              child: ClipRect(child: child!),
            ),
          ),
        );
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
