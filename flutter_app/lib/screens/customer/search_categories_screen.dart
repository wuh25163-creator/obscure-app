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
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Icon(Icons.search, color: AppTheme.primary, size: 22),
                      ),
                      Expanded(
                        child: Center(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '搜尋設計靈感...',
                              hintStyle: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14, color: AppTheme.primary.withValues(alpha: 0.4)),
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(vertical: 13),
                            ),
                            style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.accentYellow,
                          foregroundColor: AppTheme.primary,
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                          side: const BorderSide(color: AppTheme.primary, width: 1.5),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          elevation: 0
                        ),
                        child: const Text('搜尋', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 13)),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Categories header
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('分類', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 20, letterSpacing: -0.5)),
                  const SizedBox(width: 10),
                  Expanded(child: Container(height: 2, color: AppTheme.primary, margin: const EdgeInsets.only(bottom: 3))),
                ],
              ),
              const SizedBox(height: 12),

              // Category cards horizontal scroll
              ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.trackpad,
                  },
                ),
                child: SizedBox(
                  height: 220,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      _buildCategoryCard('主視覺設計', '視覺識別系統', AppTheme.accentYellow),
                      const SizedBox(width: 10),
                      _buildCategoryCard('包裝設計', '包裝美學設計', AppTheme.accentBlue),
                      const SizedBox(width: 10),
                      _buildCategoryCard('產品設計', '工業與產品設計', AppTheme.accentRed),
                      const SizedBox(width: 10),
                      _buildCategoryCard('插畫設計', '藝術插畫繪製', const Color(0xFF6BCB77)),
                      const SizedBox(width: 10),
                      _buildCategoryCard('字體設計', '字體研發與設計', const Color(0xFFFF6B6B)),
                      const SizedBox(width: 10),
                      _buildCategoryCard('網頁設計', '使用者介面設計', const Color(0xFFB388FF)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Recent Projects Header
              Row(
                children: const [
                  Icon(Icons.grid_view, size: 20),
                  SizedBox(width: 8),
                  Text('近期專案', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 20)),
                ],
              ),
              const SizedBox(height: 12),

              // Results Grid
              Column(
                children: [
                  _buildProjectCard(
                    title: '實驗性字體系列 01',
                    tag: '#品牌',
                    isLarge: true,
                    bgColor: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _buildProjectCard(
                          title: '單色形態',
                          tag: '',
                          isLarge: false,
                          bgColor: const Color(0xFFFFF5CC),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildProjectCard(
                          title: '色彩理論',
                          tag: '',
                          isLarge: false,
                          bgColor: const Color(0xFFFDE8E8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: const NeoBoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Container(width: 64, height: 64, decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2), color: Colors.grey.shade300)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('#包裝', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.accentRed)),
                              const SizedBox(height: 2),
                              const Text('生態模組盒 V.2', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14)),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Container(width: 12, height: 12, decoration: BoxDecoration(border: Border.all(color: AppTheme.primary), color: AppTheme.primary)),
                                  const SizedBox(width: 4),
                                  Container(width: 12, height: 12, decoration: BoxDecoration(border: Border.all(color: AppTheme.primary), color: AppTheme.accentYellow)),
                                  const SizedBox(width: 4),
                                  Container(width: 12, height: 12, decoration: BoxDecoration(border: Border.all(color: AppTheme.primary), color: AppTheme.accentRed)),
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
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ObscureNavBar(
        pageContext: context,
        activeRoute: '/search_categories',
      ),
    );
  }

  Widget _buildCategoryCard(String title, String subtitle, Color bgColor) {
    return Container(
      width: 140,
      decoration: const NeoBoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: bgColor,
                border: const Border(bottom: BorderSide(color: AppTheme.primary, width: 2)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 13)),
                      Text(subtitle, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Colors.grey)),
                    ],
                  ),
                ),
                const Icon(Icons.north_east, size: 14),
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
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: isLarge ? 160 : 90,
            decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2), color: Colors.grey.shade300),
          ),
          const SizedBox(height: 10),
          if (tag.isNotEmpty) ...[
            Text(tag, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 10, color: AppTheme.accentBlue)),
            const SizedBox(height: 2),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(title, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: isLarge ? 15 : 12), overflow: TextOverflow.ellipsis)),
              if (isLarge) const Icon(Icons.favorite, size: 18),
            ],
          )
        ],
      ),
    );
  }
}
