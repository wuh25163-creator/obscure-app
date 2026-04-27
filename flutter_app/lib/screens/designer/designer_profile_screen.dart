import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../core/neo_button.dart';
import '../shared/folder_project_card.dart';

class DesignerProfileScreen extends StatefulWidget {
  const DesignerProfileScreen({super.key});

  @override
  State<DesignerProfileScreen> createState() => _DesignerProfileScreenState();
}

class _DesignerProfileScreenState extends State<DesignerProfileScreen> {
  final List<Map<String, dynamic>> savedProjects = [
    {
      'projectName': '品牌重生計畫 2024',
      'concept': '結合現代簡約與傳統工藝，重新定義品牌價值。透過高對比度的色彩與俐落的線條，傳達品牌的創新與力量。',
      'tags': ['#品牌', '#視覺設計'],
      'tabColor': AppTheme.accentBlue,
      'bodyColor': AppTheme.surface,
    },
    {
      'projectName': '未來字體實驗',
      'concept': '探索字體在數位時代的流動性與可能性。打破傳統排版限制。',
      'tags': ['#字體', '#實驗'],
      'tabColor': AppTheme.accentRed,
      'bodyColor': AppTheme.surface,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String name = args?['name'] as String? ?? '設計師';
    final String? major = args?['major'] as String?;

    return Scaffold(
      appBar: const ObscureAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Avatar & Name Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                          color: AppTheme.surface,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppTheme.primary, width: 2.5),
                          boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(4, 4))],
                        ),
                        alignment: Alignment.center,
                        child: AppTheme.isDesigner
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.add_a_photo, size: 24, color: AppTheme.primary),
                                  const SizedBox(height: 4),
                                  Text('新增照片', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 9, color: AppTheme.primary.withValues(alpha: 0.6))),
                                ],
                              )
                            : const Icon(Icons.person, size: 44, color: AppTheme.primary),
                      ),
                      Positioned(
                        bottom: -6,
                        right: -6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: const NeoBoxDecoration(color: AppTheme.accentRed),
                          child: const Text('PRO', style: TextStyle(color: Colors.white, fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 11)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  // Name & Major
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 28, height: 1.1)),
                        if (major != null && major.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(major, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w800, fontSize: 15, color: AppTheme.accentRed)),
                        ]
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Tags
              Wrap(
                alignment: WrapAlignment.start,
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildTag('#台式'),
                  _buildTag('#像素'),
                  _buildTag('#BRUTALIST'),
                ],
              ),
              const SizedBox(height: 14),

              // Stats
              Container(
                decoration: NeoBoxDecoration(color: AppTheme.surface),
                child: Row(
                  children: [
                    Expanded(child: _buildStatItem('瀏覽數', '0', true)),
                    Expanded(child: _buildStatItem('獲讚數', '0', true)),
                    Expanded(child: Container(
                      color: AppTheme.accentYellow,
                      child: _buildStatItem('粉絲數', '0', false),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: NeoButton(
                      onTap: () {},
                      color: AppTheme.accentBlue,
                      depth: 3.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        child: const Text('追蹤', style: TextStyle(color: Colors.white, fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 15)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: NeoButton(
                      onTap: () {},
                      color: AppTheme.surface,
                      depth: 3.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        alignment: Alignment.center,
                        child: const Text('傳送訊息', style: TextStyle(color: AppTheme.primary, fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 15)),
                      ),
                    ),
                  ),
                ],
              ),
              if (AppTheme.isDesigner) ...[
                const SizedBox(height: 10),
                NeoButton(
                  onTap: () => Navigator.pushNamed(context, '/income_dashboard'),
                  color: AppTheme.accentYellow,
                  depth: 3.0,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    child: const Text('收入儀表板', style: TextStyle(color: AppTheme.primary, fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 15)),
                  ),
                ),
              ],
              const SizedBox(height: 24),

              // Projects
              const Text('精選專案', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 18, decoration: TextDecoration.underline)),
              const SizedBox(height: 14),

              ...savedProjects.map((p) => FolderProjectCard(
                projectName: p['projectName'],
                concept: p['concept'],
                tags: p['tags'],
                tabColor: p['tabColor'] ?? AppTheme.accentBlue,
                bodyColor: p['bodyColor'] ?? AppTheme.surface,
              )),

              const SizedBox(height: 14),

              if (AppTheme.isDesigner) ...[
                NeoButton(
                  onTap: () async {
                    final newProject = await Navigator.pushNamed(context, '/new_work');
                    if (newProject != null && newProject is Map<String, dynamic>) {
                      setState(() {
                        final Color newTabColor = savedProjects.length % 2 == 0 ? AppTheme.accentYellow : AppTheme.accentRed;
                        newProject['tabColor'] = newTabColor;
                        newProject['bodyColor'] = AppTheme.surface;
                        savedProjects.add(newProject);
                      });
                    }
                  },
                  color: AppTheme.surface,
                  depth: 4.0,
                  child: SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle_outline, size: 36, color: AppTheme.primary),
                        SizedBox(height: 10),
                        Text('新增專案', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 15, color: AppTheme.primary)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),
              ],

              // Designer Award
              Container(
                decoration: const NeoBoxDecoration(color: AppTheme.accentRed),
                padding: const EdgeInsets.all(16),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.star, size: 32, color: Colors.white),
                    SizedBox(height: 10),
                    Text('本月最佳設計師', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white)),
                    SizedBox(height: 4),
                    Text('獲獎原因：在「台灣現代主義視覺表現」方面的卓越成就', style: TextStyle(color: Colors.white, fontSize: 12, letterSpacing: 0)),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Email Collab
              Container(
                decoration: const NeoBoxDecoration(color: AppTheme.accentYellow),
                padding: const EdgeInsets.all(16),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('合作洽談？', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 22)),
                    SizedBox(height: 8),
                    Text('salmon.studio@design.tw', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, decoration: TextDecoration.underline)),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ObscureNavBar(pageContext: context, activeRoute: '/designer_profile'),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: AppTheme.primary, width: 1.5),
      ),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 0, fontFamily: 'Space Grotesk')),
    );
  }

  Widget _buildStatItem(String label, String value, bool isBorderRight) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        border: isBorderRight ? const Border(right: BorderSide(color: AppTheme.primary, width: 2)) : null,
      ),
      child: Column(
        children: [
          Text(label.toUpperCase(), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w900, fontFamily: 'Space Grotesk', color: Colors.grey, letterSpacing: 0)),
          const SizedBox(height: 2),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, fontFamily: 'Space Grotesk')),
        ],
      ),
    );
  }
}
