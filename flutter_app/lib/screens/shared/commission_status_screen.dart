import 'package:flutter/material.dart';
import '../../core/app_icons.dart';
import '../../core/app_theme.dart';

class CommissionStatusScreen extends StatelessWidget {
  const CommissionStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ObscureAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Title & Stats Section
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const NeoBoxDecoration(color: AppTheme.accentYellow),
                      padding: const EdgeInsets.all(24),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('委託追蹤器', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24, height: 1.1, letterSpacing: 0)),
                          SizedBox(height: 8),
                          Text('活躍專案監控系統 v1.0', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 0)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const NeoBoxDecoration(color: AppTheme.surface),
                      padding: const EdgeInsets.all(24),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('0', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 48)),
                          Text('進行中總數', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0)),
                        ],
                      ),
                    ),
                  ),
                ],
                ),
              ),
              const SizedBox(height: 32),

              // Tabs
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.primary, width: 4))),
                  child: Row(
                    children: [
                      _buildTab('執行中', isActive: true),
                      _buildTab('確認中'),
                      _buildTab('已完成', isLast: true),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Empty State
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  border: Border.all(color: AppTheme.primary, width: 4),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.search_off, size: 64, color: AppTheme.primary),
                    SizedBox(height: 16),
                    Text(
                      '目前還沒有任務呢先來找看看好了!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 20, height: 1.4, letterSpacing: 0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.accentYellow,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: AppTheme.primary, width: 4),
          borderRadius: BorderRadius.zero,
        ),
        child: const Icon(Icons.add, color: AppTheme.primary, size: 32),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 4),
          child: Container(
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: AppTheme.primary, width: 3),
              boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(4, 4))],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(context, 'home', AppTheme.isDesigner ? '/daily_planner' : '/discovery_feed'),
                _buildNavItem(context, 'search', '/search_categories'),
                _buildNavItem(context, 'shining', '/commission_status', isActive: true),
                _buildNavItem(context, 'chat', '/message_inbox'),
                _buildNavItem(context, 'user', '/designer_profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String text, {bool isActive = false, bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.accentYellow : AppTheme.surface,
        border: Border(right: BorderSide(color: AppTheme.primary, width: isLast ? 0 : 4)),
      ),
      child: Text(text, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: isActive ? FontWeight.w900 : FontWeight.bold, fontSize: 16, color: AppTheme.primary, letterSpacing: 0)),
    );
  }

  Widget _buildNavItem(BuildContext context, String iconName, String route, {bool isActive = false}) {
    return GestureDetector(
      onTap: () {
        if (!isActive) Navigator.pushReplacementNamed(context, route);
      },
      child: Container(
        width: isActive ? 48 : 40,
        height: isActive ? 48 : 40,
        decoration: BoxDecoration(
          color: isActive ? AppTheme.accentYellow : Colors.white,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: AppIcons.fromName(iconName, color: AppTheme.primary, size: 28, isActive: isActive),
      ),
    );
  }
}

