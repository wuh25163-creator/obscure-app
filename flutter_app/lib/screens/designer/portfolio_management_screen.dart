import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class PortfolioManagementScreen extends StatelessWidget {
  const PortfolioManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 角色守衛：設計師專屬頁面，非設計師立即導向客戶主頁
    if (!AppTheme.isDesigner) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/discovery_feed');
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: const ObscureAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Page Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('作品集', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 36, letterSpacing: 0)),
                        Container(
                          decoration: const BoxDecoration(border: Border(left: BorderSide(color: AppTheme.accentYellow, width: 4))),
                          padding: const EdgeInsets.only(left: 12),
                          child: const Text('管理您的創意資產', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0)),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/new_work');
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primary, foregroundColor: Colors.white, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), side: const BorderSide(color: AppTheme.primary, width: 2), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
                    child: const Text('上傳新作品', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0)),
                  )
                ],
              ),
              const SizedBox(height: 32),

              // Filter System
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildFilterChip('全部專案', isActive: true),
                  _buildFilterChip('#手繪'),
                  _buildFilterChip('#個人特色'),
                  _buildFilterChip('#商業合作'),
                  _buildFilterChip('#數位藝術'),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.filter_list, color: AppTheme.accentRed, size: 20),
                      SizedBox(width: 4),
                      Text('進階篩選', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, color: AppTheme.accentRed, decoration: TextDecoration.underline, decorationColor: AppTheme.accentRed, decorationThickness: 2, fontSize: 14, letterSpacing: 0)),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 32),

              // Bento Grid Top Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const NeoBoxDecoration(color: AppTheme.surface),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(Icons.folder, size: 48),
                                  Container(color: AppTheme.accentRed, padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), child: const Text('私人', style: TextStyle(color: Colors.white, fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0))),
                                ],
                              ),
                              const SizedBox(height: 16),
                              const Text('作品集(個人)', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 20, height: 1.2, letterSpacing: 0)),
                              const Text('個人作品集收藏', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, color: AppTheme.primary),
                                  children: [
                                    TextSpan(text: '24 ', style: TextStyle(fontSize: 24)),
                                    TextSpan(text: '項目', style: TextStyle(fontSize: 14, letterSpacing: 0)),
                                  ],
                                ),
                              ),
                              Container(decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2)), padding: const EdgeInsets.all(8), child: const Icon(Icons.arrow_forward)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const NeoBoxDecoration(color: Colors.white),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              decoration: const BoxDecoration(color: Colors.grey, border: Border(right: BorderSide(color: AppTheme.primary, width: 4))),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              color: AppTheme.surface,
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(decoration: BoxDecoration(border: Border.all(color: AppTheme.primary)), padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), child: const Text('#手繪', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0))),
                                          const SizedBox(width: 8),
                                          Container(decoration: BoxDecoration(border: Border.all(color: AppTheme.primary)), padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), child: const Text('#INK', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0))),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      const Text('墨水革命 (INK REVOLUTION)', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 22, height: 1.2, letterSpacing: 0)),
                                      const SizedBox(height: 16),
                                      const Text('一系列表現力豐富的手繪實驗，專注於線條重量與原始情感紋理。', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0)),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(height: 2, color: AppTheme.accentYellow, margin: const EdgeInsets.only(bottom: 16)),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text('更新於：2023.10.12', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0)),
                                          Row(
                                            children: [
                                              Container(padding: const EdgeInsets.all(4), decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2)), child: const Icon(Icons.edit, size: 20)),
                                              const SizedBox(width: 8),
                                              Container(padding: const EdgeInsets.all(4), decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2)), child: const Icon(Icons.delete, size: 20, color: AppTheme.accentRed)),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),

              // Stats Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const NeoBoxDecoration(color: AppTheme.accentBlue),
                      padding: const EdgeInsets.all(16),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.visibility, color: Colors.white, size: 48),
                          SizedBox(height: 8),
                          Text('12.5K', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24, color: Colors.white, letterSpacing: 0)),
                          Text('總觀看次數', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white, letterSpacing: 0)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: const NeoBoxDecoration(color: AppTheme.accentYellow),
                      padding: const EdgeInsets.all(24),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.auto_awesome),
                              Text('最新', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0)),
                            ],
                          ),
                          Spacer(),
                          Text('速寫本\n系列 01', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 18, height: 1.2, letterSpacing: 0)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: const NeoBoxDecoration(color: AppTheme.surface),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2)),
                              padding: const EdgeInsets.all(12),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('當前狀態', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.accentRed, letterSpacing: 0)),
                                  Text('已發布', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 20, letterSpacing: 0)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2)),
                              padding: const EdgeInsets.all(12),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('儲存空間', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.accentBlue, letterSpacing: 0)),
                                  Text('已使用 84%', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 18, letterSpacing: 0)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 32),

              // Grid Items
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildGridItem('Personal Style #02', '#個人特色'),
                  _buildGridItem('Digital Void', '#DIGITAL'),
                  _buildGridItem('Hand Drawn Chaos', '#手繪'),
                  
                  // Add New Box
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/new_work');
                    },
                    child: Container(
                      decoration: BoxDecoration(color: const Color(0xFFEEE9E0), border: Border.all(color: AppTheme.primary, width: 4)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_circle, size: 48),
                          SizedBox(height: 16),
                          Text('新增專案', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0)),
                        ],
                      ),
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
                _buildNavItem(context, Icons.search_rounded, '/search_categories'),
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

  Widget _buildFilterChip(String text, {bool isActive = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? AppTheme.accentYellow : AppTheme.surface,
        border: Border.all(color: AppTheme.primary, width: 2),
        boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(2, 2))],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(text, style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, color: AppTheme.primary, fontSize: 14, letterSpacing: 0)),
    );
  }

  Widget _buildGridItem(String title, String tag) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, border: Border.all(color: AppTheme.primary, width: 4), boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(2, 2))]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(color: Colors.grey, border: Border(bottom: BorderSide(color: AppTheme.primary, width: 4))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2), decoration: BoxDecoration(color: AppTheme.accentYellow, border: Border.all(color: AppTheme.primary)), child: Text(tag, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0))),
                    const Icon(Icons.more_vert, size: 20),
                  ],
                )
              ],
            ),
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

