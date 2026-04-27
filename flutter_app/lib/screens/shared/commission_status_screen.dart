import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class CommissionStatusScreen extends StatelessWidget {
  const CommissionStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ObscureAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
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
                        padding: const EdgeInsets.all(16),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('委託追蹤器', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 18, height: 1.1, letterSpacing: 0)),
                            SizedBox(height: 4),
                            Text('活躍專案監控系統 v1.0', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const NeoBoxDecoration(color: AppTheme.surface),
                        padding: const EdgeInsets.all(12),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('0', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 36)),
                            Text('進行中', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 0)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Tabs
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.primary, width: 3))),
                  child: Row(
                    children: [
                      _buildTab('執行中', isActive: true),
                      _buildTab('確認中'),
                      _buildTab('已完成', isLast: true),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Empty State
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  border: Border.all(color: AppTheme.primary, width: 2),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.search_off, size: 48, color: AppTheme.primary),
                    SizedBox(height: 12),
                    Text(
                      '目前還沒有任務呢\n先來找看看好了!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 16, height: 1.5, letterSpacing: 0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ObscureNavBar(pageContext: context, activeRoute: '/commission_status'),
    );
  }

  Widget _buildTab(String text, {bool isActive = false, bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isActive ? AppTheme.accentYellow : AppTheme.surface,
        border: Border(right: BorderSide(color: AppTheme.primary, width: isLast ? 0 : 2)),
      ),
      child: Text(text, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: isActive ? FontWeight.w900 : FontWeight.bold, fontSize: 14, color: AppTheme.primary, letterSpacing: 0)),
    );
  }
}
