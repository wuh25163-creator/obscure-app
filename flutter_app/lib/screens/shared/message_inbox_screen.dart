import 'package:flutter/material.dart';
import '../../core/app_icons.dart';
import '../../core/app_theme.dart';
import 'chat_room_screen.dart';

class MessageInboxScreen extends StatelessWidget {
  const MessageInboxScreen({super.key});

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
              // Search Bar
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: AppTheme.surface, border: Border.all(color: AppTheme.primary, width: 2), boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(2, 2))]),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: AppTheme.primary),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(border: InputBorder.none, hintText: AppTheme.isDesigner ? '搜尋訊息...' : '和設計師對話...', hintStyle: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 14)),
                              style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 14),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(color: AppTheme.accentYellow, border: Border.all(color: AppTheme.primary, width: 2), boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(2, 2))]),
                    child: IconButton(
                      icon: const Icon(Icons.filter_list, color: AppTheme.primary),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),

              // Messages
              if (AppTheme.isDesigner) ...[
                _buildMessageItem(
                  context,
                  name: '林**小姐 (Ms. Lin)',
                  time: '22 分鐘前',
                  subject: '**方案 - 尊享計劃確認',
                  message: '你好，關於**方案的內容，我還有一些細節想請教...',
                  isActive: true,
                  unreadCount: 2,
                ),
                const SizedBox(height: 16),
                _buildMessageItem(
                  context,
                  name: '張先生 (Mr. Chang)',
                  time: '2 小時前',
                  subject: '**方案 - 進度更新',
                  message: '謝謝你的詳細說明，我們會再討論一下。',
                ),
                const SizedBox(height: 16),
                _buildMessageItem(
                  context,
                  name: '王小姐 (Ms. Wang)',
                  time: '昨天',
                  subject: '**方案 - 續約諮詢',
                  message: '請問續約後原本的優惠還能保留嗎？',
                ),
                const SizedBox(height: 16),
                _buildMessageItemSystem(context),
              ] else ...[
                _buildMessageItem(
                  context,
                  name: '專屬設計師',
                  time: '剛剛',
                  subject: '專案啟動',
                  message: '和設計師對話',
                  isActive: true,
                  unreadCount: 1,
                ),
                const SizedBox(height: 16),
                _buildMessageItemSystem(context),
              ],
              
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
      floatingActionButton: AppTheme.isDesigner ? FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.accentRed,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: AppTheme.primary, width: 4),
          borderRadius: BorderRadius.zero,
        ),
        child: const Icon(Icons.edit, size: 32),
      ) : null,
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
                _buildNavItem(context, 'shining', '/commission_status'),
                _buildNavItem(context, 'chat', '/message_inbox', isActive: true),
                _buildNavItem(context, 'user', '/designer_profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageItem(BuildContext context, {required String name, required String time, required String subject, required String message, bool isActive = false, int unreadCount = 0}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatRoomScreen(
              contactName: name,
              contactStatus: 'Online',
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surface,
          border: Border.all(color: AppTheme.primary, width: isActive ? 4 : 2),
          boxShadow: isActive ? const [BoxShadow(color: AppTheme.primary, offset: Offset(4, 4))] : null,
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2), color: Colors.grey.shade300),
                  child: const Icon(Icons.person, color: Colors.white, size: 40),
                ),
                if (unreadCount > 0)
                  Positioned(
                    bottom: -4,
                    right: -4,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(color: AppTheme.accentYellow, border: Border.all(color: AppTheme.primary, width: 2)),
                      alignment: Alignment.center,
                      child: Text('$unreadCount', style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 12, letterSpacing: 0)),
                    ),
                  )
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(name, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0), maxLines: 1, overflow: TextOverflow.ellipsis)),
                      Text(time, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primary.withValues(alpha: isActive ? 1.0 : 0.6), letterSpacing: 0)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(subject, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: isActive ? AppTheme.accentRed : AppTheme.primary, letterSpacing: 0)),
                  const SizedBox(height: 4),
                  Text(message, style: TextStyle(fontSize: 14, color: AppTheme.primary.withValues(alpha: isActive ? 1.0 : 0.7), letterSpacing: 0), maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Icon(Icons.chevron_right, color: AppTheme.primary.withValues(alpha: isActive ? 1.0 : 0.3)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMessageItemSystem(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ChatRoomScreen(
              contactName: 'SYSTEM',
              contactStatus: 'Automated Message',
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(color: AppTheme.surface, border: Border.all(color: AppTheme.primary, width: 2)),
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(color: AppTheme.accentBlue, border: Border.all(color: AppTheme.primary, width: 2)),
              child: const Icon(Icons.corporate_fare, color: Colors.white, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(child: Text('系統通知', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0), maxLines: 1, overflow: TextOverflow.ellipsis)),
                      Text('2 天前', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primary.withValues(alpha: 0.6), letterSpacing: 0)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text('帳戶安全性', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0)),
                  const SizedBox(height: 4),
                  Text('您的帳戶最近從新的裝置登入，若非本人...', style: TextStyle(fontSize: 14, color: AppTheme.primary.withValues(alpha: 0.7), letterSpacing: 0), maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Icon(Icons.chevron_right, color: AppTheme.primary.withValues(alpha: 0.3)),
              ],
            )
          ],
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

