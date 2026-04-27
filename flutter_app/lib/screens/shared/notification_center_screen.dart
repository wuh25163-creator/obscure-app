import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../core/neo_button.dart';
import '../../core/app_icons.dart';

class NotificationCenterScreen extends StatelessWidget {
  const NotificationCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: ObscureAppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: AppIcons.notification(color: AppTheme.primary, size: 22, isFill: true),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () => Navigator.pop(context),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '收件箱',
                        style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 26, fontWeight: FontWeight.w900, letterSpacing: 0, height: 1.1),
                      ),
                      const SizedBox(height: 2),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primary),
                          children: [
                            TextSpan(text: '您有 '),
                            TextSpan(text: '3 則未讀', style: TextStyle(color: AppTheme.accentRed)),
                            TextSpan(text: ' 通知'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  NeoButton(
                    onTap: () {},
                    color: AppTheme.accentBlue,
                    depth: 3.0,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: const Text('全部已讀', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12, letterSpacing: 0)),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Tabs — 2x2 grid
              Row(
                children: [
                  Expanded(child: _buildTab('全部', isActive: true)),
                  const SizedBox(width: 6),
                  Expanded(child: _buildTab('委託')),
                  const SizedBox(width: 6),
                  Expanded(child: _buildTab('系統')),
                  const SizedBox(width: 6),
                  Expanded(child: _buildTab('付款')),
                ],
              ),
              const SizedBox(height: 14),

              // Notification items
              _buildNotificationItem(
                icon: Icons.payments, iconBgColor: AppTheme.accentYellow,
                badgeText: '付款', badgeColor: AppTheme.accentBlue,
                time: '2 分鐘前', title: '林小姐已支付訂金',
                subtitle: "專案：'新黑色風格插畫集'",
                actionColor: AppTheme.primary, actionText: '收入儀表板', shadowColor: AppTheme.accentBlue,
              ),
              const SizedBox(height: 10),
              _buildNotificationItem(
                icon: Icons.star, iconBgColor: Colors.white,
                badgeText: '精選', badgeColor: AppTheme.accentRed,
                time: '1 小時前', title: '新精選作品上線',
                subtitle: "您的作品 'Structural Decay' 已登上首頁。",
                actionColor: AppTheme.accentBlue, actionText: '查看作品',
                bgColor: AppTheme.accentYellow, shadowColor: AppTheme.primary,
              ),
              const SizedBox(height: 10),
              _buildNotificationItem(
                icon: Icons.architecture, iconBgColor: AppTheme.accentBlue, iconColor: Colors.white,
                badgeText: '委託', badgeColor: AppTheme.primary,
                time: '昨天', title: '合約已簽署',
                subtitle: "Agency X 已接受粗獷主義網頁提案。",
                actionColor: AppTheme.accentYellow, actionText: '查看合約',
                actionTextColor: AppTheme.primary, shadowColor: AppTheme.accentRed,
              ),
              const SizedBox(height: 10),
              _buildNotificationItem(
                icon: Icons.settings, iconBgColor: const Color(0xFFE0E0E0),
                badgeText: '系統', badgeColor: Colors.grey,
                time: '2 天前', title: '帳號驗證完成',
                subtitle: "身份已由全球合規團隊驗證。",
                isSystem: true, shadowColor: Colors.transparent,
              ),
              const SizedBox(height: 20),

              // Footer Stats
              Container(
                decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2)),
                child: Column(
                  children: [
                    _buildStatBox('84%', '回覆率', AppTheme.accentBlue, Colors.white),
                    _buildStatBox('12', '進行中專案', Colors.white, AppTheme.primary),
                    _buildStatBox('\$4.2K', '待處理發票', AppTheme.accentYellow, AppTheme.primary, isLast: true),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title, {bool isActive = false}) {
    return NeoButton(
      onTap: () {},
      color: isActive ? AppTheme.accentRed : Colors.white,
      depth: isActive ? 3.0 : 2.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, color: isActive ? Colors.white : AppTheme.primary, fontSize: 12, letterSpacing: 0),
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required Color iconBgColor,
    Color iconColor = AppTheme.primary,
    required String badgeText,
    required Color badgeColor,
    required String time,
    required String title,
    required String subtitle,
    Color bgColor = Colors.white,
    Color shadowColor = AppTheme.primary,
    bool isSystem = false,
    String? actionText,
    Color? actionColor,
    Color actionTextColor = Colors.white,
  }) {
    return Opacity(
      opacity: isSystem ? 0.6 : 1.0,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: AppTheme.primary, width: 2),
          boxShadow: shadowColor != Colors.transparent ? [BoxShadow(color: shadowColor, offset: const Offset(3, 3))] : null,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(color: iconBgColor, border: Border.all(color: AppTheme.primary, width: 2)),
                  child: Icon(icon, color: iconColor, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            color: badgeColor,
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            child: Text(badgeText, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 0)),
                          ),
                          const SizedBox(width: 6),
                          Text(time, style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 11, fontWeight: FontWeight.bold, color: AppTheme.primary.withValues(alpha: 0.5), letterSpacing: 0)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(title, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 14, fontWeight: FontWeight.w900, height: 1.2, letterSpacing: 0)),
                      const SizedBox(height: 2),
                      Text(subtitle, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 12, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500, letterSpacing: 0)),
                    ],
                  ),
                ),
              ],
            ),
            if (actionText != null && actionColor != null) ...[
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: NeoButton(
                      onTap: () {},
                      color: actionColor,
                      depth: 3.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        alignment: Alignment.center,
                        child: Text(actionText, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, color: actionTextColor, fontSize: 13, letterSpacing: 0)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.more_vert, size: 20),
                ],
              )
            ],
            if (isSystem) ...[
              const SizedBox(height: 10),
              const Align(alignment: Alignment.centerLeft, child: Icon(Icons.delete_outline, size: 20)),
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(String value, String label, Color bgColor, Color textColor, {bool isLast = false}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: bgColor,
        border: !isLast ? const Border(bottom: BorderSide(color: AppTheme.primary, width: 2)) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 13, fontWeight: FontWeight.bold, color: textColor, letterSpacing: 0)),
          Text(value, style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 22, fontWeight: FontWeight.w900, color: textColor, letterSpacing: 0)),
        ],
      ),
    );
  }
}
