import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class CustomerSignupScreen extends StatelessWidget {
  const CustomerSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: const ObscureAppBar(
        leading: SizedBox.shrink(),
        actions: [SizedBox.shrink()],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Hero Title ──
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '開始尋找你的需求',
                    style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primary.withValues(alpha: 0.5), letterSpacing: 0),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '找尋你的需求',
                    style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 36, height: 1.0, letterSpacing: -1.0),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 6,
                    width: 60,
                    color: AppTheme.accentYellow,
                  ),
                  const Text(
                    '找尋協作夥伴',
                    style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // ── Main Card (everything inside one big border box) ──
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppTheme.primary, width: 2),
                    boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(4, 4))],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Image area (top portion of the box)
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F1ED),
                            border: Border.all(color: AppTheme.primary.withValues(alpha: 0.2), width: 1),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.image_outlined, size: 28, color: AppTheme.primary.withValues(alpha: 0.25)),
                              const SizedBox(height: 4),
                              Text(
                                '點擊上傳圖片',
                                style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 11, color: AppTheme.primary.withValues(alpha: 0.25)),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Horizontal divider
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        height: 1.5,
                        color: AppTheme.primary.withValues(alpha: 0.15),
                      ),

                      // Name + Phone (side by side, underline)
                      Expanded(
                        flex: 2,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildUnderlineField('姓名/暱稱', '輸入姓名')),
                            const SizedBox(width: 16),
                            Expanded(child: _buildUnderlineField('電話', '輸入電話')),
                          ],
                        ),
                      ),

                      // 需求 text area
                      const Text('需求', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0)),
                      const SizedBox(height: 4),
                      Expanded(
                        flex: 3,
                        child: TextField(
                          maxLines: null,
                          expands: true,
                          textAlignVertical: TextAlignVertical.top,
                          style: const TextStyle(fontSize: 13, fontFamily: 'Space Grotesk', letterSpacing: 0),
                          decoration: InputDecoration(
                            hintText: '描述你的需求大綱',
                            hintStyle: TextStyle(color: AppTheme.primary.withValues(alpha: 0.3), fontSize: 13),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: AppTheme.primary, width: 1.5),
                              borderRadius: BorderRadius.zero,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: AppTheme.accentRed, width: 2),
                              borderRadius: BorderRadius.zero,
                            ),
                            contentPadding: const EdgeInsets.all(10),
                            isDense: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Submit button — outline style (inside the box)
                      GestureDetector(
                        onTap: () {
                          AppTheme.isDesigner = false;
                          Navigator.pushReplacementNamed(context, '/discovery_feed');
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppTheme.primary, width: 2),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('開始合作', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 16, color: AppTheme.primary, letterSpacing: 0)),
                              SizedBox(width: 10),
                              Icon(Icons.arrow_forward, color: AppTheme.primary, size: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUnderlineField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0)),
        const SizedBox(height: 4),
        TextField(
          style: const TextStyle(fontSize: 13, fontFamily: 'Space Grotesk', letterSpacing: 0),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppTheme.primary.withValues(alpha: 0.3), fontSize: 13),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.primary, width: 1.5)),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.accentRed, width: 2)),
            contentPadding: const EdgeInsets.symmetric(vertical: 6),
            isDense: true,
          ),
        ),
      ],
    );
  }
}
