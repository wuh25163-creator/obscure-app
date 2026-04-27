import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../core/neo_button.dart';

class CustomerSignupScreen extends StatelessWidget {
  const CustomerSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              // Header
              const Text(
                '開始尋找你的需求',
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.w900,
                  fontSize: 26,
                  height: 1.1,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 80,
                height: 8,
                decoration: BoxDecoration(
                  color: AppTheme.accentYellow,
                  border: Border.all(color: AppTheme.primary, width: 1.5),
                ),
              ),
              const SizedBox(height: 12),

              // Image placeholder
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E0D8),
                    border: Border.all(color: AppTheme.primary, width: 2),
                    boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(3, 3))],
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image_outlined, size: 32, color: AppTheme.primary.withValues(alpha: 0.3)),
                      const SizedBox(height: 6),
                      Text(
                        '圖片區域',
                        style: TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: AppTheme.primary.withValues(alpha: 0.3),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Form
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Name + Phone in one row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildField('姓名/暱稱', '輸入姓名'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildField('電話', '輸入電話'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Needs description
                    const Text('你的需求', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0, fontSize: 12, fontFamily: 'Space Grotesk')),
                    const SizedBox(height: 4),
                    Expanded(
                      child: TextField(
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk', letterSpacing: 0),
                        decoration: InputDecoration(
                          hintText: '描述你的需求大綱',
                          hintStyle: TextStyle(color: AppTheme.primary.withValues(alpha: 0.3), fontSize: 13),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppTheme.primary, width: 2),
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
                    const SizedBox(height: 10),

                    // Submit button
                    NeoButton(
                      onTap: () {
                        AppTheme.isDesigner = false;
                        Navigator.pushReplacementNamed(context, '/discovery_feed');
                      },
                      color: AppTheme.primary,
                      shadowColor: AppTheme.accentYellow,
                      depth: 4.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '開始合作',
                              style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 16, color: Colors.white, letterSpacing: 0),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0, fontSize: 12, fontFamily: 'Space Grotesk')),
        const SizedBox(height: 4),
        TextField(
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk', letterSpacing: 0),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppTheme.primary.withValues(alpha: 0.3), fontSize: 13),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.primary, width: 2)),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.accentYellow, width: 2)),
            contentPadding: const EdgeInsets.symmetric(vertical: 6),
            isDense: true,
          ),
        ),
      ],
    );
  }
}
