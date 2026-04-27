import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../core/neo_button.dart';

class DesignerSignupScreen extends StatefulWidget {
  const DesignerSignupScreen({super.key});

  @override
  State<DesignerSignupScreen> createState() => _DesignerSignupScreenState();
}

class _DesignerSignupScreenState extends State<DesignerSignupScreen> {
  bool? _isMajor;
  double _workCount = 24.0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();

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
              Container(
                decoration: const BoxDecoration(
                  border: Border(left: BorderSide(color: AppTheme.accentYellow, width: 6)),
                ),
                padding: const EdgeInsets.only(left: 12),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '加入實驗室',
                      style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 28, height: 1.0, letterSpacing: 0),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '設計師入駐',
                      style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 0, color: AppTheme.accentRed),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Form Card
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: const NeoBoxDecoration(color: AppTheme.surface),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Name field
                          _buildInputField('姓名(暱稱)', '請輸入您的設計師代號', controller: _nameController),
                          const SizedBox(height: 12),

                          // Phone + Age
                          Row(
                            children: [
                              Expanded(child: _buildInputField('電話', '+886')),
                              const SizedBox(width: 12),
                              Expanded(child: _buildInputField('年齡', '24')),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Major question
                          const Text('是否為設計本科', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primary, letterSpacing: 0)),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Expanded(child: _buildChoiceButton('是', _isMajor == true, () => setState(() => _isMajor = true))),
                              const SizedBox(width: 10),
                              Expanded(child: _buildChoiceButton('非本科', _isMajor == false, () => setState(() => _isMajor = false))),
                            ],
                          ),
                          const SizedBox(height: 8),
                          _buildInputField('', '描述您的專業領域', controller: _majorController),
                          const SizedBox(height: 12),

                          // Work count slider
                          const Text('工作次數', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primary, letterSpacing: 0)),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Expanded(
                                child: Slider(
                                  value: _workCount,
                                  min: 0,
                                  max: 100,
                                  activeColor: AppTheme.primary,
                                  inactiveColor: AppTheme.primary.withValues(alpha: 0.3),
                                  onChanged: (val) => setState(() => _workCount = val),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                decoration: BoxDecoration(
                                  color: AppTheme.accentYellow,
                                  border: Border.all(color: AppTheme.primary, width: 2),
                                ),
                                child: Text('${_workCount.toInt()}', style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 16)),
                              )
                            ],
                          ),

                          const Spacer(),

                          // Submit button
                          NeoButton(
                            onTap: () {
                              AppTheme.isDesigner = true;
                              Navigator.pushReplacementNamed(context, '/designer_profile', arguments: {
                                'name': _nameController.text.isNotEmpty ? _nameController.text : '匿名設計師',
                                'major': _isMajor == true ? _majorController.text : null,
                              });
                            },
                            color: AppTheme.accentYellow,
                            shadowColor: AppTheme.primary,
                            depth: 4.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 13),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('開始合作', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 16, color: AppTheme.primary, letterSpacing: 0)),
                                  SizedBox(width: 10),
                                  Icon(Icons.arrow_forward, size: 20),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Decorative bolt badge
                    Positioned(
                      top: -16,
                      right: -8,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: AppTheme.accentYellow,
                          border: Border.all(color: AppTheme.primary, width: 2),
                        ),
                        child: const Icon(Icons.bolt, size: 22, color: AppTheme.primary),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint, {TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(label, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primary, letterSpacing: 0)),
          const SizedBox(height: 3),
        ],
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
          style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w500, fontSize: 14, color: AppTheme.primary, letterSpacing: 0),
        )
      ],
    );
  }

  Widget _buildChoiceButton(String text, bool isSelected, VoidCallback onTap) {
    return NeoButton(
      onTap: onTap,
      color: isSelected ? AppTheme.primary : AppTheme.surface,
      depth: 2.0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
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