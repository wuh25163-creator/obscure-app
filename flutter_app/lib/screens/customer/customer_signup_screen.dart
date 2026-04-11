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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '開始\n尋找你的需求',
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.w900,
                  fontSize: 48,
                  height: 1.1,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 24),
              // Yellow decorative top block
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 120,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppTheme.accentYellow,
                    border: Border.all(color: AppTheme.primary, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Blue Block
              Container(
                decoration: const NeoBoxDecoration(color: AppTheme.accentBlue),
                padding: const EdgeInsets.all(24),
                child: const Text(
                  '形式追隨\n功能。',
                  style: TextStyle(
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    fontSize: 22,
                    height: 1.3,
                    letterSpacing: 0,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              
              // The Red Block with intricate graphic
              Stack(
                clipBehavior: Clip.none,
                children: [

                  // Main Red Block containing steps
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 380, left: 24, right: 24, bottom: 32),
                    decoration: const NeoBoxDecoration(color: AppTheme.accentRed),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildStep(number: '01', title: '定義你的願景', bgColor: AppTheme.accentYellow),
                        const SizedBox(height: 16),
                        _buildStep(number: '02', title: '提交參數需求', bgColor: const Color(0xFFD6E3FF)),
                        const SizedBox(height: 16),
                        _buildStep(number: '03', title: '開始執行專案', bgColor: const Color(0xFFFFDAD6)),
                      ],
                    ),
                  ),
                  // Grey Graphic Block
                  Positioned(
                    top: 16,
                    left: 16,
                    right: -8,
                    child: Container(
                      height: 340,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2E0D8),
                        border: Border.all(color: AppTheme.primary, width: 4),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // "FORM" text
                          Center(
                            child: Text(
                              '形式',
                              style: TextStyle(
                                fontFamily: 'Space Grotesk',
                                fontWeight: FontWeight.w900,
                                fontSize: 80,
                                color: Colors.white.withValues(alpha: 0.6),
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                          // Geometric Shapes
                          // 1. Right side grey transparent circle
                          Positioned(
                            right: -16,
                            top: 60,
                            child: Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.25),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          // 2. White square
                          Positioned(
                            left: 60,
                            top: 100,
                            child: Container(
                              width: 140,
                              height: 140,
                              color: const Color(0xFFF2F0E9),
                            ),
                          ),
                          // 3. Black semi-circle
                          Positioned(
                            left: 50,
                            top: 30,
                            child: Container(
                              width: 140,
                              height: 70,
                              decoration: const BoxDecoration(
                                color: AppTheme.primary,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(70),
                                  topRight: Radius.circular(70),
                                ),
                              ),
                            ),
                          ),
                          // 4. Black circle
                          Positioned(
                            left: 20,
                            bottom: 40,
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: const BoxDecoration(
                                color: AppTheme.primary,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 64),
              const Text('姓名/暱稱', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0, fontSize: 16, fontFamily: 'Space Grotesk')),
              const SizedBox(height: 8),
              _buildTextField('輸入姓名'),
              const SizedBox(height: 32),
              
              const Text('電話', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0, fontSize: 16, fontFamily: 'Space Grotesk')),
              const SizedBox(height: 8),
              _buildTextField('輸入電話'),
              const SizedBox(height: 32),
              
              const Text('你的需求內容', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0, fontSize: 16, fontFamily: 'Space Grotesk')),
              const SizedBox(height: 8),
              _buildTextArea('描述你的需求大綱'),
              const SizedBox(height: 48),
              
              NeoButton(
                onTap: () {
                  AppTheme.isDesigner = false;
                  Navigator.pushReplacementNamed(context, '/discovery_feed');
                },
                color: AppTheme.primary,
                shadowColor: AppTheme.accentYellow,
                depth: 8.0,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '開始合作',
                        style: TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                          color: Colors.white,
                          letterSpacing: 0,
                        ),
                      ),
                      SizedBox(width: 16),
                      Icon(Icons.arrow_forward, color: Colors.white, size: 32),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.primary, width: 4),
                  borderRadius: BorderRadius.zero,
                ),
                child: const Text(
                  '注意：所有提交的內容都將透過 Obscure 協定進行處理。我們優先考慮結構的完整性，而非純粹的裝飾性。',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, height: 1.5, letterSpacing: 0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep({required String number, required String title, required Color bgColor}) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: AppTheme.primary, width: 2),
          ),
          alignment: Alignment.center,
          child: Text(
            number,
            style: const TextStyle(fontWeight: FontWeight.w900, fontFamily: 'Space Grotesk', fontSize: 18),
          ),
        ),
        const SizedBox(width: 16),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk', fontSize: 18, letterSpacing: 0)),
      ],
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk', letterSpacing: 0),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppTheme.primary.withValues(alpha: 0.3)),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primary, width: 4),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppTheme.accentYellow, width: 4),
        ),
      ),
    );
  }

  Widget _buildTextArea(String hint) {
    return TextField(
      maxLines: 4,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Space Grotesk', letterSpacing: 0),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: AppTheme.primary.withValues(alpha: 0.3)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.primary, width: 4),
          borderRadius: BorderRadius.zero,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppTheme.accentRed, width: 4),
          borderRadius: BorderRadius.zero,
        ),
      ),
    );
  }
}

