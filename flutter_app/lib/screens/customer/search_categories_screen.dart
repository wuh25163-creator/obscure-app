import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../../core/app_theme.dart';

class SearchCategoriesScreen extends StatelessWidget {
  const SearchCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ObscureAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: true,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Search Section
              Container(
                decoration: const NeoBoxDecoration(color: AppTheme.surface),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Icon(Icons.search, color: AppTheme.primary, size: 32),
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '搜尋設計靈感...',
                          hintStyle: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold),
                        ),
                        style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.accentYellow,
                        foregroundColor: AppTheme.primary,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                        side: const BorderSide(color: AppTheme.primary, width: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                        elevation: 0
                      ),
                      child: const Text('搜尋', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 16)),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 48),

              // Categories
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('分類', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 32, letterSpacing: -1)),
                  const SizedBox(width: 16),
                  Expanded(child: Container(height: 4, color: AppTheme.primary, margin: const EdgeInsets.only(bottom: 8))),
                ],
              ),
              const SizedBox(height: 24),
              ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.trackpad,
                  },
                ),
                child: SizedBox(
                  height: 420,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildCategoryCard('主視覺設計', '視覺識別系統', AppTheme.accentYellow),
                      const SizedBox(width: 16),
                      _buildCategoryCard('包裝設計', '包裝美學設計', AppTheme.accentBlue),
                      const SizedBox(width: 16),
                      _buildCategoryCard('產品設計', '工業與產品設計', AppTheme.accentRed),
                      const SizedBox(width: 16),
                      _buildCategoryCard('插畫設計', '藝術插畫繪製', const Color(0xFF6BCB77)),
                      const SizedBox(width: 16),
                      _buildCategoryCard('字體設計', '字體研發與設計', const Color(0xFFFF6B6B)),
                      const SizedBox(width: 16),
                      _buildCategoryCard('網頁設計', '使用者介面設計', const Color(0xFFB388FF)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // Recent Projects Header
              const Row(
                children: [
                  Icon(Icons.grid_view, size: 32),
                  SizedBox(width: 16),
                  Text('近期專案', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24)),
                ],
              ),
              const SizedBox(height: 24),

              // Results Grid
              Column(
                children: [
                  _buildProjectCard(
                    title: '實驗性字體系列 01',
                    tag: '#品牌',
                    isLarge: true,
                    bgColor: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildProjectCard(
                          title: '單色形態',
                          tag: '',
                          isLarge: false,
                          bgColor: const Color(0xFFFFF5CC), // primary-fixed very light
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildProjectCard(
                          title: '色彩理論',
                          tag: '',
                          isLarge: false,
                          bgColor: const Color(0xFFFDE8E8), // secondary very light
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: const NeoBoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(width: 100, height: 100, decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2), color: Colors.grey.shade300)),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('#包裝', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.accentRed)),
                              const SizedBox(height: 4),
                              const Text('生態模組盒 V.2', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 18)),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Container(width: 16, height: 16, decoration: BoxDecoration(border: Border.all(color: AppTheme.primary), color: AppTheme.primary)),
                                  const SizedBox(width: 4),
                                  Container(width: 16, height: 16, decoration: BoxDecoration(border: Border.all(color: AppTheme.primary), color: AppTheme.accentYellow)),
                                  const SizedBox(width: 4),
                                  Container(width: 16, height: 16, decoration: BoxDecoration(border: Border.all(color: AppTheme.primary), color: AppTheme.accentRed)),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.accentYellow,
        foregroundColor: AppTheme.primary,
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: AppTheme.primary, width: 4),
          borderRadius: BorderRadius.zero,
        ),
        child: const Icon(Icons.add, size: 32),
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
                _buildNavItem(context, Icons.search_rounded, '/search_categories', isActive: true),
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

  Widget _buildCategoryCard(String title, String subtitle, Color bgColor) {
    return Container(
      width: 240,
      decoration: const NeoBoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: bgColor,
              border: const Border(bottom: BorderSide(color: AppTheme.primary, width: 4)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24)),
                    Text(subtitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.grey)),
                  ],
                ),
                const Icon(Icons.north_east),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProjectCard({required String title, required String tag, required bool isLarge, required Color bgColor}) {
    return Container(
      decoration: NeoBoxDecoration(color: bgColor),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: isLarge ? 300 : 150,
            decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2), color: Colors.grey.shade300),
          ),
          const SizedBox(height: 16),
          if (tag.isNotEmpty) ...[
            Text(tag, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.accentBlue)),
            const SizedBox(height: 4),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: isLarge ? 24 : 14)),
              if (isLarge) const Icon(Icons.favorite),
            ],
          )
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

