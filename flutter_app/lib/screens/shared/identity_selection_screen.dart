import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../core/neo_button.dart';

class IdentitySelectionScreen extends StatelessWidget {
  const IdentitySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ObscureAppBar(
        leading: SizedBox.shrink(),
        actions: [SizedBox.shrink()],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '請選擇',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                  height: 1.1,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Container(
                  width: 72,
                  height: 10,
                  decoration: BoxDecoration(
                    color: AppTheme.accentRed,
                    border: Border.all(color: AppTheme.primary, width: 1.5),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: _buildIdentityCard(
                  context,
                  title: '設計師',
                  description: '我想要設計工作客，做出屬於我的作品集，並增進自身的技術。',
                  actionText: '作為創作者進入',
                  icon: Icons.architecture,
                  bgColor: const Color(0xFFFFCC00),
                  iconBgColor: AppTheme.primary,
                  iconColor: const Color(0xFFFFCC00),
                  actionColor: AppTheme.primary,
                  onTap: () => Navigator.pushNamed(context, '/designer_signup'),
                ),
              ),
              const SizedBox(height: 14),
              Expanded(
                child: _buildIdentityCard(
                  context,
                  title: '客戶',
                  description: '我有一個想法，但需要設計人才的協助，來完善這個想法。',
                  actionText: '作為客戶進入',
                  icon: Icons.hail,
                  bgColor: AppTheme.surface,
                  iconBgColor: AppTheme.accentBlue,
                  iconColor: Colors.white,
                  actionColor: AppTheme.accentBlue,
                  onTap: () => Navigator.pushNamed(context, '/customer_signup'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIdentityCard(
    BuildContext context, {
    required String title,
    required String description,
    required String actionText,
    required IconData icon,
    required Color bgColor,
    required Color iconBgColor,
    required Color iconColor,
    required Color actionColor,
    required VoidCallback onTap,
  }) {
    return NeoButton(
      onTap: onTap,
      color: bgColor,
      shadowColor: AppTheme.primary,
      depth: 3.0,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 44,
            height: 44,
            color: iconBgColor,
            alignment: Alignment.center,
            child: Icon(icon, color: iconColor, size: 24),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.w900,
                  fontSize: 26,
                  height: 1.1,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide(color: AppTheme.primary, width: 3)),
                ),
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                actionText,
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  color: actionColor,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward, color: actionColor, size: 18),
            ],
          ),
        ],
      ),
    );
  }
}
