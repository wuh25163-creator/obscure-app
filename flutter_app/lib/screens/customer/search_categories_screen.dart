import 'package:flutter/material.dart';
import '../../core/app_icons.dart';
import 'package:flutter/gestures.dart';
import '../../core/app_theme.dart';

class SearchCategoriesScreen extends StatelessWidget {
  const SearchCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: const ObscureAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          primary: true,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24, vertical: isMobile ? 24 : 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Search Section
              Container(
                decoration: const NeoBoxDecoration(color: AppTheme.surface),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 16),
                        child: Icon(Icons.search, color: AppTheme.primary, size: isMobile ? 24 : 32),
                      ),
                      Expanded(
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '搜尋設計靈感...',
                              hintStyle: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: isMobile ? 14 : 18),
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: isMobile ? 14 : 18),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.accentYellow,
                          foregroundColor: AppTheme.primary,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                          side: BorderSide(color: AppTheme.primary, width: isMobile ? 1.5 : 2),
                          padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
                          elevation: 0
                        ),
                        child: Text('搜尋', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: isMobile ? 14 : 16)),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 24 : 48),

              // Categories
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('分類', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: isMobile ? 24 : 32, letterSpacing: -1)),
                  SizedBox(width: isMobile ? 12 : 16),
                  Expanded(child: Container(height: isMobile ? 2 : 4, color: AppTheme.primary, margin: EdgeInsets.only(bottom: isMobile ? 4 : 8))),
                ],
              ),
              SizedBox(height: isMobile ? 16 : 24),
              ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.trackpad,
                  },
                ),
                child: SizedBox(
                  height: isMobile ? 260 : 420,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildCategoryCard(context, '主視覺設計', '視覺識別系統', AppTheme.accentYellow),
                      SizedBox(width: isMobile ? 12 : 16),
                      _buildCategoryCard(context, '包裝設計', '包裝美學設計', AppTheme.accentBlue),
                      SizedBox(width: isMobile ? 12 : 16),
                      _buildCategoryCard(context, '產品設計', '工業與產品設計', AppTheme.accentRed),
                      SizedBox(width: isMobile ? 12 : 16),
                      _buildCategoryCard(context, '插畫設計', '藝術插畫繪製', const Color(0xFF6BCB77)),
                      SizedBox(width: isMobile ? 12 : 16),
                      _buildCategoryCard(context, '字體設計', '字體研發與設計', const Color(0xFFFF6B6B)),
                      SizedBox(width: isMobile ? 12 : 16),
                      _buildCategoryCard(context, '網頁設計', '使用者介面設計', const Color(0xFFB388FF)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: isMobile ? 32 : 48),

              // Recent Projects Header
              Row(
                children: [
                  Icon(Icons.grid_view, size: isMobile ? 24 : 32),
                  SizedBox(width: isMobile ? 12 : 16),
                  Text('近期專案', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: isMobile ? 20 : 24)),
                ],
              ),
              SizedBox(height: isMobile ? 16 : 24),

              // Results Grid
              Column(
                children: [
                  _buildProjectCard(
                    context,
                    title: '實驗性字體系列 01',
                    tag: '#品牌',
                    isLarge: true,
                    bgColor: Colors.white,
                  ),
                  SizedBox(height: isMobile ? 12 : 16),
                  Row(
                    children: [
                      Expanded(
                        child: _buildProjectCard(
                          context,
                          title: '單色形態',
                          tag: '',
                          isLarge: false,
                          bgColor: const Color(0xFFFFF5CC), // primary-fixed very light
                        ),
                      ),
                      SizedBox(width: isMobile ? 12 : 16),
                      Expanded(
                        child: _buildProjectCard(
                          context,
                          title: '色彩理論',
                          tag: '',
                          isLarge: false,
                          bgColor: const Color(0xFFFDE8E8), // secondary very light
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: isMobile ? 12 : 16),
                  Container(
                    decoration: const NeoBoxDecoration(color: Colors.white),
                    padding: EdgeInsets.all(isMobile ? 12 : 16),
                    child: Row(
                      children: [
                        Container(width: isMobile ? 60 : 100, height: isMobile ? 60 : 100, decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2), color: Colors.grey.shade300)),
                        SizedBox(width: isMobile ? 12 : 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('#包裝', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.accentRed)),
                              SizedBox(height: isMobile ? 2 : 4),
                              Text('生態模組盒 V.2', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: isMobile ? 14 : 18)),
                              SizedBox(height: isMobile ? 4 : 8),
                              Row(
                                children: [
                                  Container(width: isMobile ? 12 : 16, height: isMobile ? 12 : 16, decoration: BoxDecoration(border: Border.all(color: AppTheme.primary), color: AppTheme.primary)),
                                  const SizedBox(width: 4),
                                  Container(width: isMobile ? 12 : 16, height: isMobile ? 12 : 16, decoration: BoxDecoration(border: Border.all(color: AppTheme.primary), color: AppTheme.accentYellow)),
                                  const SizedBox(width: 4),
                                  Container(width: isMobile ? 12 : 16, height: isMobile ? 12 : 16, decoration: BoxDecoration(border: Border.all(color: AppTheme.primary), color: AppTheme.accentRed)),
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: isMobile ? 12 : 16, right: isMobile ? 12 : 16, bottom: isMobile ? 12 : 16, top: 4),
          child: Container(
            height: isMobile ? 56 : 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: AppTheme.primary, width: isMobile ? 2 : 3),
              boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(4, 4))],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(context, 'home', AppTheme.isDesigner ? '/daily_planner' : '/discovery_feed'),
                _buildNavItem(context, 'search', '/search_categories', isActive: true),
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

  Widget _buildCategoryCard(BuildContext context, String title, String subtitle, Color bgColor) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      width: isMobile ? 160 : 240,
      decoration: const NeoBoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: isMobile ? 180 : 300,
            decoration: BoxDecoration(
              color: bgColor,
              border: Border(bottom: BorderSide(color: AppTheme.primary, width: isMobile ? 2 : 4)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(isMobile ? 12 : 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: isMobile ? 16 : 24)),
                    Text(subtitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: isMobile ? 10 : 12, color: Colors.grey)),
                  ],
                ),
                Icon(Icons.north_east, size: isMobile ? 16 : 24),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, {required String title, required String tag, required bool isLarge, required Color bgColor}) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      decoration: NeoBoxDecoration(color: bgColor),
      padding: EdgeInsets.all(isMobile ? 12 : 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: isLarge ? (isMobile ? 180 : 300) : (isMobile ? 100 : 150),
            decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2), color: Colors.grey.shade300),
          ),
          SizedBox(height: isMobile ? 12 : 16),
          if (tag.isNotEmpty) ...[
            Text(tag, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.accentBlue)),
            SizedBox(height: isMobile ? 2 : 4),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: isLarge ? (isMobile ? 16 : 24) : (isMobile ? 12 : 14))),
              if (isLarge) Icon(Icons.favorite, size: isMobile ? 20 : 24),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String iconName, String route, {bool isActive = false}) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return GestureDetector(
      onTap: () {
        if (!isActive) Navigator.pushReplacementNamed(context, route);
      },
      child: Container(
        width: isActive ? (isMobile ? 40 : 48) : (isMobile ? 32 : 40),
        height: isActive ? (isMobile ? 40 : 48) : (isMobile ? 32 : 40),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.accentYellow : Colors.white,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: AppIcons.fromName(iconName, color: AppTheme.primary, size: isMobile ? 24 : 28, isActive: isActive),
      ),
    );
  }
}
