import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import 'package:flutter/gestures.dart';
import '../../core/neo_button.dart';

class DiscoveryFeedScreen extends StatelessWidget {
  const DiscoveryFeedScreen({super.key});

  static const List<Map<String, dynamic>> _leftItems = [
    {'height': 200.0, 'label': '粗獷派形態', 'tag': '#建築', 'accent': AppTheme.accentYellow},
    {'height': 130.0, 'label': '字體研究', 'tag': '#字體', 'accent': AppTheme.accentBlue},
    {'height': 170.0, 'label': '墨水系列', 'tag': '#手繪', 'accent': AppTheme.accentRed},
    {'height': 230.0, 'label': '虛實空間', 'tag': '#空間', 'accent': AppTheme.accentYellow},
    {'height': 190.0, 'label': '材質研究', 'tag': '#材質', 'accent': AppTheme.accentBlue},
  ];

  static const List<Map<String, dynamic>> _rightItems = [
    {'height': 140.0, 'label': '色彩理論', 'tag': '#色彩', 'accent': AppTheme.accentBlue},
    {'height': 190.0, 'label': '網格系統', 'tag': '#版面', 'accent': AppTheme.accentRed},
    {'height': 270.0, 'label': '動態研究', 'tag': '#動態', 'accent': AppTheme.accentYellow},
    {'height': 110.0, 'label': '質感研究', 'tag': '#質感', 'accent': AppTheme.accentRed},
    {'height': 160.0, 'label': '品牌識別', 'tag': '#品牌', 'accent': AppTheme.accentBlue},
  ];

  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildPill('所有作品', isActive: true),
                        const SizedBox(width: 8),
                        _buildPill('建築'),
                        const SizedBox(width: 8),
                        _buildPill('字體'),
                        const SizedBox(width: 8),
                        _buildPill('手繪'),
                        const SizedBox(width: 8),
                        _buildPill('品牌'),
                      ],
                    ),
                  ),
                ),
              ),
              Container(height: 3, color: AppTheme.primary),

              // Section header
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      '作品',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        letterSpacing: 0,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 3,
                        color: AppTheme.primary,
                        margin: const EdgeInsets.only(bottom: 4),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      '10 個專案',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        letterSpacing: 0,
                      ),
                    ),
                  ],
                ),
              ),

              // Masonry grid
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
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
                    const SizedBox(width: 10),
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
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ObscureNavBar(
        pageContext: context,
        activeRoute: '/discovery_feed',
      ),
    );
  }

  Widget _buildPill(String text, {bool isActive = false}) {
    return NeoButton(
      onTap: () {},
      color: isActive ? AppTheme.primary : AppTheme.surface,
      depth: 2.0,
      borderWidth: 1.5,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
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
      padding: const EdgeInsets.only(bottom: 10),
      child: NeoButton(
        onTap: () {
          Navigator.pushNamed(context, '/project_detail');
        },
        color: AppTheme.surface,
        depth: 3.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: height,
              color: const Color(0xFFEBEBEB),
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(6),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                color: accent,
                child: Text(
                  tag,
                  style: const TextStyle(
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.bold,
                    fontSize: 9,
                    color: AppTheme.primary,
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppTheme.primary, width: 2)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
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
                  const Icon(Icons.arrow_forward, size: 12, color: AppTheme.primary),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
