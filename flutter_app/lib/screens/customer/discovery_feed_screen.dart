import 'package:flutter/material.dart';
import '../../core/app_icons.dart';
import 'package:flutter/gestures.dart';
import '../../core/app_theme.dart';
import '../../core/neo_button.dart';

class DiscoveryFeedScreen extends StatelessWidget {
  const DiscoveryFeedScreen({super.key});

  // Data for left and right masonry columns [height, label, tag, accent]
  static const List<Map<String, dynamic>> _leftItems = [
    {'height': 280.0, 'label': '粗獷派形態', 'tag': '#建築', 'accent': AppTheme.accentYellow},
    {'height': 160.0, 'label': '字體研究', 'tag': '#字體', 'accent': AppTheme.accentBlue},
    {'height': 220.0, 'label': '墨水系列', 'tag': '#手繪', 'accent': AppTheme.accentRed},
    {'height': 320.0, 'label': '虛實空間', 'tag': '#空間', 'accent': AppTheme.accentYellow},
    {'height': 260.0, 'label': '材質研究', 'tag': '#材質', 'accent': AppTheme.accentBlue},
  ];

  static const List<Map<String, dynamic>> _rightItems = [
    {'height': 180.0, 'label': '色彩理論', 'tag': '#色彩', 'accent': AppTheme.accentBlue},
    {'height': 240.0, 'label': '網格系統', 'tag': '#版面', 'accent': AppTheme.accentRed},
    {'height': 360.0, 'label': '動態研究', 'tag': '#動態', 'accent': AppTheme.accentYellow},
    {'height': 140.0, 'label': '質感研究', 'tag': '#質感', 'accent': AppTheme.accentRed},
    {'height': 200.0, 'label': '品牌識別', 'tag': '#品牌', 'accent': AppTheme.accentBlue},
  ];

  @override
  Widget build(BuildContext context) {
    // 角色守衛：客戶專屬主頁，設計師立即導向設計師主頁
    if (AppTheme.isDesigner) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/daily_planner');
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: const ObscureAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Category filter pills
              ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.trackpad,
                  },
                ),
                child: Container(
                  color: AppTheme.background,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildPill('所有作品', isActive: true),
                        const SizedBox(width: 10),
                        _buildPill('建築'),
                        const SizedBox(width: 10),
                        _buildPill('字體'),
                        const SizedBox(width: 10),
                        _buildPill('手繪'),
                        const SizedBox(width: 10),
                        _buildPill('品牌'),
                      ],
                    ),
                  ),
                ),
              ),
              // Black separator line
              Container(height: 4, color: AppTheme.primary),

              // Section header
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      '作品',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        letterSpacing: 0,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        height: 4,
                        color: AppTheme.primary,
                        margin: const EdgeInsets.only(bottom: 6),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      '10 個專案',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),

              // Masonry grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: _leftItems
                            .map((item) => _buildMasonryCard(
                                  context,
                                  height: item['height'] as double,
                                  label: item['label'] as String,
                                  tag: item['tag'] as String,
                                  accent: item['accent'] as Color,
                                ))
                            .toList(),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        children: _rightItems
                            .map((item) => _buildMasonryCard(
                                  context,
                                  height: item['height'] as double,
                                  label: item['label'] as String,
                                  tag: item['tag'] as String,
                                  accent: item['accent'] as Color,
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
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
                _buildNavItem(context, 'home', AppTheme.isDesigner ? '/daily_planner' : '/discovery_feed', isActive: true),
                _buildNavItem(context, 'search', '/search_categories'),
                _buildNavItem(context, 'shining', '/commission_status'),
                _buildNavItem(context, 'chat', '/message_inbox'),
                _buildNavItem(context, 'user', '/designer_profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPill(String text, {bool isActive = false}) {
    return NeoButton(
      onTap: () {},
      color: isActive ? AppTheme.primary : AppTheme.surface,
      depth: 3.0,
      borderWidth: 2.0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Space Grotesk',
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: isActive ? Colors.white : AppTheme.primary,
        ),
      ),
    );
  }

  Widget _buildMasonryCard(
    BuildContext context, {
    required double height,
    required String label,
    required String tag,
    required Color accent,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: NeoButton(
        onTap: () {
          Navigator.pushNamed(context, '/project_detail');
        },
        color: AppTheme.surface,
        depth: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image placeholder area
            Container(
              height: height,
              color: const Color(0xFFEBEBEB),
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                color: accent,
                child: Text(
                  tag,
                  style: const TextStyle(
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: AppTheme.primary,
                  ),
                ),
              ),
            ),
            // Label bar
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppTheme.primary, width: 3)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      label,
                      style: const TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.w900,
                        fontSize: 11,
                        letterSpacing: 0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Icon(Icons.arrow_forward, size: 14, color: AppTheme.primary),
                ],
              ),
            ),
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



