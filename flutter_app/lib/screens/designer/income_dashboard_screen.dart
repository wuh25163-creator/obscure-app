import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../core/neo_button.dart';

class IncomeDashboardScreen extends StatelessWidget {
  const IncomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 角色守衛：設計師專屬頁面，非設計師立即導向客戶主頁
    if (!AppTheme.isDesigner) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/discovery_feed');
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: const ObscureAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Hero Section
              Container(
                decoration: const NeoBoxDecoration(color: AppTheme.accentYellow),
                padding: const EdgeInsets.all(32),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('收益中心', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 36, letterSpacing: 0)),
                        const SizedBox(height: 8),
                        const Text('\$42,850.00', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 48, height: 1.0, letterSpacing: 0)),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(color: AppTheme.primary, border: Border.all(color: AppTheme.primary)),
                                child: const Text('財務數據即時監控系統', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0)),
                              ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(color: AppTheme.accentBlue, border: Border.all(color: AppTheme.primary)),
                              child: const Text('+12.4% MOM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0)),
                            )
                          ],
                        )
                      ],
                    ),
                    const Positioned(
                      right: -60,
                      bottom: -60,
                      child: Opacity(
                        opacity: 0.1,
                        child: Icon(Icons.account_balance, size: 200, color: AppTheme.primary),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 48),

              // Paid Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 32, fontStyle: FontStyle.italic, color: AppTheme.primary, letterSpacing: 0),
                      children: [
                        TextSpan(text: '已付款 '),
                        TextSpan(text: 'PAID', style: TextStyle(color: AppTheme.accentBlue)),
                      ],
                    ),
                  ),
                  const Text('本月數據分析', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 0)),
                ],
              ),
              const SizedBox(height: 16),
              _buildPaidItem(Icons.payments, 'Creative Studio A', '2023.10.24 • 14:30', '+\$3,200'),
              const SizedBox(height: 16),
              _buildPaidItem(Icons.work, 'Project Delta Ltd.', '2023.10.22 • 09:15', '+\$12,500'),
              const SizedBox(height: 16),
              _buildPaidItem(Icons.person, 'Individual Client B', '2023.10.20 • 18:45', '+\$850'),
              const SizedBox(height: 48),

              // Unpaid Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 32, fontStyle: FontStyle.italic, color: AppTheme.primary, letterSpacing: 0),
                      children: [
                        TextSpan(text: '未付款 '),
                        TextSpan(text: 'UNPAID', style: TextStyle(color: AppTheme.accentRed)),
                      ],
                    ),
                  ),
                  const Text('即時摘要', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 0)),
                ],
              ),
              const SizedBox(height: 16),

              _buildUnpaidItemUrgent('Tech Nexus Co.', '逾期 3 天', '\$5,400'),
              const SizedBox(height: 16),
              _buildUnpaidItemPending('Artisan Bakery', '5 天後到期', '\$1,200'),
              const SizedBox(height: 48),

            ],
          ),
        ),
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
                _buildNavItem(context, Icons.home_rounded, AppTheme.isDesigner ? '/daily_planner' : '/discovery_feed'),
                _buildNavItem(context, Icons.search_rounded, '/search_categories'),
                _buildNavItem(context, Icons.auto_awesome_rounded, '/commission_status'),
                _buildNavItem(context, Icons.chat_bubble_outline_rounded, '/message_inbox'),
                _buildNavItem(context, Icons.person_outline_rounded, '/designer_profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaidItem(IconData icon, String title, String time, String amount) {
    return Container(
      decoration: const NeoBoxDecoration(color: AppTheme.surface),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: const Color(0xFFD6E3FF), border: Border.all(color: AppTheme.primary, width: 2)),
            child: Icon(icon, color: AppTheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0)),
                Text(time, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primary.withValues(alpha: 0.6), letterSpacing: 0)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 20, letterSpacing: 0)),
              const Text('已完成', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.accentBlue, letterSpacing: 0)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildUnpaidItemUrgent(String title, String status, String amount) {
    return Container(
      decoration: const NeoBoxDecoration(color: Color(0xFFE8E3DA)),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(color: AppTheme.accentRed, border: Border.all(color: AppTheme.primary, width: 2)),
                child: const Icon(Icons.priority_high, color: Colors.white),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 0)),
                    Text(status, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.accentRed, letterSpacing: 0)),
                  ],
                ),
              ),
              Text(amount, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24, letterSpacing: 0)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: NeoButton(
                  onTap: () {},
                  color: AppTheme.primary,
                  depth: 4.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    child: const Text('即時提領', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white, letterSpacing: 0)),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(color: AppTheme.surface, border: Border.all(color: AppTheme.primary, width: 2)),
                child: const Icon(Icons.more_horiz, color: AppTheme.primary),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildUnpaidItemPending(String title, String status, String amount) {
    return Container(
      decoration: const NeoBoxDecoration(color: AppTheme.surface),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: const Color(0xFFE8E3DA), border: Border.all(color: AppTheme.primary, width: 2)),
            child: const Icon(Icons.pending, color: AppTheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 0)),
                Text(status, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primary.withValues(alpha: 0.6), letterSpacing: 0)),
              ],
            ),
          ),
          Text(amount, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24, letterSpacing: 0)),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String route, {bool isActive = false}) {
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
        child: Icon(icon, color: AppTheme.primary, size: 28),
      ),
    );
  }
}
