import 'package:flutter/material.dart';
import '../../core/app_icons.dart';
import '../../core/app_theme.dart';

class ContractQuoteScreen extends StatelessWidget {
  const ContractQuoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: const ObscureAppBar(), // Using ObscureAppBar from app_theme
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Hero Section
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: AppTheme.accentRed,
                  border: Border.all(color: AppTheme.primary, width: 4),
                  boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(8, 8))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('合約草案\n042', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 36, fontWeight: FontWeight.w900, color: Colors.white, height: 1.1, letterSpacing: 0)),
                    SizedBox(height: 16),
                    Text('專案「Neon-Lattice」的完整服務協議。', style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: Colors.white, letterSpacing: 0)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppTheme.primary, width: 4),
                  boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(8, 8))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('狀態', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 0)),
                    const Text('待處理', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 40, fontWeight: FontWeight.w900, color: AppTheme.accentRed, letterSpacing: 0)),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      padding: const EdgeInsets.only(top: 16),
                      decoration: const BoxDecoration(border: Border(top: BorderSide(color: AppTheme.primary, width: 4))),
                      child: const Text('發布日期：2023年10月24日', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Terms of Engagement
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppTheme.primary, width: 4),
                  boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(8, 8))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.primary, width: 4))),
                      child: const Text('委任條款', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: 0)),
                    ),
                    const SizedBox(height: 24),
                    _buildTermItem('修改次數', '每階段最多三次 (3) 迭代循環。超出部分按每小時 \$250 計費。'),
                    const SizedBox(height: 24),
                    _buildTermItem('交付日期', '標準交付週期為需求確認後 14 個工作日。'),
                    const SizedBox(height: 24),
                    _buildTermItem('版權所有', '收到尾款後，完整知識產權移轉予客戶。'),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Fee Breakdown
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppTheme.primary, width: 4),
                  boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(8, 8))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      margin: const EdgeInsets.only(bottom: 24),
                      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.primary, width: 4))),
                      child: const Text('費用明細', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: 0)),
                    ),
                    _buildFeeItem('第一階段：研究調查', '\$ 2,500'),
                    const SizedBox(height: 16),
                    _buildFeeItem('第二階段：執行製作', '\$ 8,200'),
                    const SizedBox(height: 16),
                    _buildFeeItem('第三階段：品質保證', '\$ 4,000'),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      color: AppTheme.primary,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Expanded(child: Text('專案總費用', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0))),
                          Text('\$ 14,700', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 0)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Signature Area
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.accentYellow,
                  border: Border.all(color: AppTheme.primary, width: 4),
                  boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(8, 8))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('簽名', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: 0)),
                          const SizedBox(height: 16),
                          Container(
                            height: 100,
                            alignment: Alignment.bottomLeft,
                            decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.primary, width: 4))),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '在此處簽名...',
                                style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 20, fontStyle: FontStyle.italic, color: AppTheme.primary.withValues(alpha: 0.4), letterSpacing: 0),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text('簽署即表示您同意 OBSCURE 主服務協議 V4.0', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0)),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        color: AppTheme.primary,
                        alignment: Alignment.center,
                        child: const Text('簽署合約', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 0)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        decoration: const BoxDecoration(
                          border: Border(top: BorderSide(color: AppTheme.primary, width: 4)),
                        ),
                        alignment: Alignment.center,
                        child: const Text('下載 PDF', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 20, fontWeight: FontWeight.w900, color: AppTheme.primary, letterSpacing: 0)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermItem(String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(color: AppTheme.accentBlue, border: Border.all(color: AppTheme.primary, width: 3)),
          child: const Icon(Icons.check, color: Colors.white),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 0)),
              const SizedBox(height: 4),
              Text(description, style: const TextStyle(fontFamily: 'Inter', fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeeItem(String phase, String amount) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTheme.primary, width: 2, style: BorderStyle.solid)), // Using solid since dotted is trickier without custom painter
      ),
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(phase, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0))),
          Text(amount, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: 0)),
        ],
      ),
    );
  }
}


class ObscureBottomNavBar extends StatelessWidget {
  final int currentIndex;
  const ObscureBottomNavBar({super.key, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              _buildNavItem(context, 'home', AppTheme.isDesigner ? '/daily_planner' : '/discovery_feed', isActive: currentIndex == 0),
              _buildNavItem(context, 'search', '/search_categories', isActive: currentIndex == 1),
              _buildNavItem(context, 'shining', '/commission_status', isActive: currentIndex == 2),
              _buildNavItem(context, 'chat', '/message_inbox', isActive: currentIndex == 3),
              _buildNavItem(context, 'user', '/designer_profile', isActive: currentIndex == 4),
            ],
          ),
        ),
      ),
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
