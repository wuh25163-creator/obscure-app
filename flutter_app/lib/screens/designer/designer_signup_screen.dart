import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class DesignerSignupScreen extends StatefulWidget {
  const DesignerSignupScreen({super.key});

  @override
  State<DesignerSignupScreen> createState() => _DesignerSignupScreenState();
}

class _DesignerSignupScreenState extends State<DesignerSignupScreen> {
  bool? _isMajor;
  double _workCount = 24.0;
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

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
              // Hero Header
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '加入實驗室',
                        style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primary.withValues(alpha: 0.5), letterSpacing: 0),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '加入實驗室',
                        style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 36, height: 1.0, letterSpacing: -1.0),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        height: 6,
                        width: 60,
                        color: AppTheme.accentYellow,
                      ),
                      const Text(
                        '設計師入駐',
                        style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0),
                      ),
                    ],
                  ),
                  // ⚡ Badge
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: AppTheme.accentYellow,
                        border: Border.all(color: AppTheme.primary, width: 2),
                      ),
                      child: const Icon(Icons.bolt, size: 20, color: AppTheme.primary),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Form — Expanded to fill remaining space
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // 設計師代號
                    _buildUnderlineField('設計師代號', '請輸入您的設計師代號', controller: _codeController),
                    const SizedBox(height: 12),

                    // 姓名 + 年齡
                    Row(
                      children: [
                        Expanded(child: _buildUnderlineField('姓名(暱稱)', '請輸入名稱', controller: _nameController)),
                        const SizedBox(width: 16),
                        Expanded(child: _buildUnderlineField('年齡', '24', controller: _ageController)),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // 電話
                    _buildUnderlineField('電話', '+886', controller: _phoneController),
                    const SizedBox(height: 14),

                    // 是否為設計本科
                    const Text('是否為設計本科', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(child: _buildChoiceButton('是', _isMajor == true, () => setState(() => _isMajor = true))),
                        const SizedBox(width: 10),
                        Expanded(child: _buildChoiceButton('非本科', _isMajor == false, () => setState(() => _isMajor = false))),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // 工作次數 — 數字在左
                    const Text('工作次數', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.accentYellow,
                            border: Border.all(color: AppTheme.primary, width: 2),
                          ),
                          alignment: Alignment.center,
                          child: Text('${_workCount.toInt()}', style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 14)),
                        ),
                        Expanded(
                          child: Slider(
                            value: _workCount,
                            min: 0,
                            max: 100,
                            activeColor: AppTheme.primary,
                            inactiveColor: AppTheme.primary.withValues(alpha: 0.2),
                            onChanged: (val) => setState(() => _workCount = val),
                          ),
                        ),
                      ],
                    ),

                    const Spacer(),

                    // Submit — 黃色填滿
                    GestureDetector(
                      onTap: () {
                        AppTheme.isDesigner = true;
                        Navigator.pushReplacementNamed(context, '/designer_profile', arguments: {
                          'name': _nameController.text.isNotEmpty ? _nameController.text : '匿名設計師',
                          'major': _isMajor == true ? '設計本科' : null,
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: AppTheme.accentYellow,
                          border: Border.all(color: AppTheme.primary, width: 2),
                          boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(3, 3))],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '開始合作',
                              style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 16, color: AppTheme.primary, letterSpacing: 0),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward, color: AppTheme.primary, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUnderlineField(String label, String hint, {TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 0)),
        const SizedBox(height: 3),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppTheme.primary.withValues(alpha: 0.3), fontFamily: 'Space Grotesk', fontWeight: FontWeight.w500, fontSize: 13),
            enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.primary, width: 2)),
            focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.accentBlue, width: 2)),
            contentPadding: const EdgeInsets.symmetric(vertical: 6),
            isDense: true,
          ),
          style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w600, fontSize: 14, letterSpacing: 0),
        ),
      ],
    );
  }

  Widget _buildChoiceButton(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primary : Colors.white,
          border: Border.all(color: AppTheme.primary, width: 2),
          boxShadow: isSelected ? const [BoxShadow(color: AppTheme.primary, offset: Offset(2, 2))] : null,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: isSelected ? Colors.white : AppTheme.primary,
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }
}