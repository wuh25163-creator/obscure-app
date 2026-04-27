import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../core/neo_button.dart';

class IncomeDashboardScreen extends StatelessWidget {
  const IncomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Hero Section
              Container(
                decoration: const NeoBoxDecoration(color: AppTheme.accentYellow),
                padding: const EdgeInsets.all(16),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('收益中心', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 20, letterSpacing: 0)),
                        const SizedBox(height: 4),
                        const Text('\$42,850.00', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 34, height: 1.0, letterSpacing: 0)),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(color: AppTheme.primary, border: Border.all(color: AppTheme.primary)),
                              child: const Text('財務即時監控', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 0)),
                            ),
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(color: AppTheme.accentBlue, border: Border.all(color: AppTheme.primary)),
                              child: const Text('+12.4% MOM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 0)),
                            )
                          ],
                        )
                      ],
                    ),
                    const Positioned(
                      right: -40,
                      bottom: -40,
                      child: Opacity(
                        opacity: 0.1,
                        child: Icon(Icons.account_balance, size: 140, color: AppTheme.primary),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Paid Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 20, fontStyle: FontStyle.italic, color: AppTheme.primary, letterSpacing: 0),
                      children: [
                        TextSpan(text: '已付款 '),
                        TextSpan(text: 'PAID', style: TextStyle(color: AppTheme.accentBlue)),
                      ],
                    ),
                  ),
                  const Text('本月數據', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0)),
                ],
              ),
              const SizedBox(height: 10),
              _buildPaidItem(Icons.payments, 'Creative Studio A', '2023.10.24 • 14:30', '+\$3,200'),
              const SizedBox(height: 10),
              _buildPaidItem(Icons.work, 'Project Delta Ltd.', '2023.10.22 • 09:15', '+\$12,500'),
              const SizedBox(height: 10),
              _buildPaidItem(Icons.person, 'Individual Client B', '2023.10.20 • 18:45', '+\$850'),
              const SizedBox(height: 20),

              // Unpaid Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 20, fontStyle: FontStyle.italic, color: AppTheme.primary, letterSpacing: 0),
                      children: [
                        TextSpan(text: '未付款 '),
                        TextSpan(text: 'UNPAID', style: TextStyle(color: AppTheme.accentRed)),
                      ],
                    ),
                  ),
                  const Text('即時摘要', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0)),
                ],
              ),
              const SizedBox(height: 10),
              _buildUnpaidItemUrgent('Tech Nexus Co.', '逾期 3 天', '\$5,400'),
              const SizedBox(height: 10),
              _buildUnpaidItemPending('Artisan Bakery', '5 天後到期', '\$1,200'),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ObscureNavBar(pageContext: context, activeRoute: '/designer_profile'),
    );
  }

  Widget _buildPaidItem(IconData icon, String title, String time, String amount) {
    return Container(
      decoration: const NeoBoxDecoration(color: AppTheme.surface),
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: const Color(0xFFD6E3FF), border: Border.all(color: AppTheme.primary, width: 2)),
            child: Icon(icon, color: AppTheme.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 0)),
                Text(time, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 11, color: AppTheme.primary.withValues(alpha: 0.6), letterSpacing: 0)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 16, letterSpacing: 0)),
              const Text('已完成', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.accentBlue, letterSpacing: 0)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildUnpaidItemUrgent(String title, String status, String amount) {
    return Container(
      decoration: const NeoBoxDecoration(color: Color(0xFFE8E3DA)),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: AppTheme.accentRed, border: Border.all(color: AppTheme.primary, width: 2)),
                child: const Icon(Icons.priority_high, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0)),
                    Text(status, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 11, color: AppTheme.accentRed, letterSpacing: 0)),
                  ],
                ),
              ),
              Text(amount, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 18, letterSpacing: 0)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: NeoButton(
                  onTap: () {},
                  color: AppTheme.primary,
                  depth: 3.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: const Text('即時提領', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white, letterSpacing: 0)),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: AppTheme.surface, border: Border.all(color: AppTheme.primary, width: 2)),
                child: const Icon(Icons.more_horiz, color: AppTheme.primary, size: 20),
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
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: const Color(0xFFE8E3DA), border: Border.all(color: AppTheme.primary, width: 2)),
            child: const Icon(Icons.pending, color: AppTheme.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0)),
                Text(status, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 11, color: AppTheme.primary.withValues(alpha: 0.6), letterSpacing: 0)),
              ],
            ),
          ),
          Text(amount, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 18, letterSpacing: 0)),
        ],
      ),
    );
  }
}
