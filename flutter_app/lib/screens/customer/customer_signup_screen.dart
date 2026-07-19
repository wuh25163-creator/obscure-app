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
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 7, height: 62, color: AppTheme.accentYellow),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '找尋你的需求',
                        style: TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w900,
                          fontSize: 37,
                          height: 0.94,
                          letterSpacing: -1.2,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        '找尋協作夥伴',
                        style: TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // ── Main Card (everything inside one big border box) ──
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppTheme.primary, width: 1.5),
                    boxShadow: const [
                      BoxShadow(color: AppTheme.primary, offset: Offset(4, 4)),
                    ],
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Image area (top portion of the box)
                      SizedBox(
                        height: 200,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2F1ED),
                            border: Border.all(
                              color: AppTheme.primary.withValues(alpha: 0.2),
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.image_outlined,
                                size: 28,
                                color: AppTheme.primary.withValues(alpha: 0.25),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '點擊上傳圖片',
                                style: TextStyle(
                                  fontFamily: 'Space Grotesk',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                  color: AppTheme.primary.withValues(
                                    alpha: 0.25,
                                  ),
                                ),
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildUnderlineField('姓名/暱稱', '輸入姓名'),
                          ),
                          const SizedBox(width: 16),
                          Expanded(child: _buildUnderlineField('電話', '輸入電話')),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // 需求 text area
                      const Text(
                        '需求',
                        style: TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          letterSpacing: 0,
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        height: 52,
                        child: TextField(
                          maxLines: null,
                          expands: true,
                          textAlignVertical: TextAlignVertical.top,
                          style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Space Grotesk',
                            letterSpacing: 0,
                          ),
                          decoration: InputDecoration(
                            hintText: '描述你的需求大綱',
                            hintStyle: TextStyle(
                              color: AppTheme.primary.withValues(alpha: 0.3),
                              fontSize: 12,
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppTheme.primary,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.zero,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppTheme.accentRed,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.zero,
                            ),
                            contentPadding: const EdgeInsets.all(10),
                            isDense: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Submit button — outline style (inside the box)
                      GestureDetector(
                        onTap: () {
                          AppTheme.isDesigner = false;
                          Navigator.pushReplacementNamed(
                            context,
                            '/discovery_feed',
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 13),
                          decoration: BoxDecoration(
                            color: AppTheme.primary,
                            border: Border.all(
                              color: AppTheme.primary,
                              width: 1.5,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: AppTheme.accentBlue,
                                offset: Offset(3, 3),
                                blurRadius: 0,
                              ),
                            ],
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '開始合作',
                                style: TextStyle(
                                  fontFamily: 'Space Grotesk',
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15,
                                  color: AppTheme.paper,
                                  letterSpacing: 0,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.arrow_forward,
                                color: AppTheme.paper,
                                size: 20,
                              ),
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
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.bold,
            fontSize: 11,
            letterSpacing: 0,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          style: const TextStyle(
            fontSize: 12,
            fontFamily: 'Space Grotesk',
            letterSpacing: 0,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppTheme.primary.withValues(alpha: 0.3),
              fontSize: 12,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.primary, width: 1.0),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppTheme.accentRed, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 6),
            isDense: true,
          ),
        ),
      ],
    );
  }
}
