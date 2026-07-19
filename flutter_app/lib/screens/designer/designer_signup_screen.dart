import 'package:flutter/material.dart';

import '../../core/app_theme.dart';

class DesignerSignupScreen extends StatefulWidget {
  const DesignerSignupScreen({super.key});

  @override
  State<DesignerSignupScreen> createState() => _DesignerSignupScreenState();
}

class _DesignerSignupScreenState extends State<DesignerSignupScreen> {
  bool? _isMajor;
  double _workCount = 0.0;
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
                        '加入實驗室',
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
                        '設計師入駐',
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
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.paper,
                  border: Border.all(
                    color: AppTheme.primary,
                    width: AppStroke.regular,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppTheme.primary,
                      offset: Offset(3, 3),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildUnderlineField(
                      '設計師代號',
                      '請輸入您的設計師代號',
                      controller: _codeController,
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildUnderlineField(
                            '姓名',
                            '請輸入姓名',
                            controller: _nameController,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildUnderlineField(
                            '年齡',
                            '24',
                            controller: _ageController,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _buildUnderlineField(
                      '電話',
                      '+886',
                      controller: _phoneController,
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      '是否為設計本科',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        letterSpacing: 0,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: _buildChoiceButton(
                            '是',
                            _isMajor == true,
                            () => setState(() => _isMajor = true),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildChoiceButton(
                            '非本科',
                            _isMajor == false,
                            () => setState(() => _isMajor = false),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      '工作次數',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        letterSpacing: 0,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.accentYellow,
                            border: Border.all(
                              color: AppTheme.primary,
                              width: AppStroke.regular,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _workCount >= 10 ? '10+' : '${_workCount.toInt()}',
                            style: const TextStyle(
                              fontFamily: 'Space Grotesk',
                              fontWeight: FontWeight.w900,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            value: _workCount,
                            min: 0,
                            max: 10,
                            divisions: 10,
                            activeColor: AppTheme.primary,
                            inactiveColor: AppTheme.primary.withValues(
                              alpha: 0.2,
                            ),
                            onChanged: (val) =>
                                setState(() => _workCount = val),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {
                        AppTheme.isDesigner = true;
                        Navigator.pushReplacementNamed(
                          context,
                          '/designer_profile',
                          arguments: {
                            'name': _nameController.text.isNotEmpty
                                ? _nameController.text
                                : '匿名設計師',
                            'major': _isMajor == true ? '設計本科' : null,
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: AppTheme.accentYellow,
                          border: Border.all(
                            color: AppTheme.primary,
                            width: AppStroke.regular,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: AppTheme.primary,
                              offset: Offset(3, 3),
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
                                color: AppTheme.primary,
                                letterSpacing: 0,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward,
                              color: AppTheme.primary,
                              size: 20,
                            ),
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

  Widget _buildUnderlineField(
    String label,
    String hint, {
    TextEditingController? controller,
  }) {
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
        const SizedBox(height: 3),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppTheme.primary.withValues(alpha: 0.3),
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.primary,
                width: AppStroke.regular,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.accentBlue,
                width: AppStroke.regular,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 6),
            isDense: true,
          ),
          style: const TextStyle(
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.w600,
            fontSize: 13,
            letterSpacing: 0,
          ),
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
          color: isSelected ? AppTheme.primary : AppTheme.surface,
          border: Border.all(color: AppTheme.primary, width: AppStroke.regular),
          boxShadow: const [
            BoxShadow(
              color: AppTheme.primary,
              offset: Offset(3, 3),
              blurRadius: 0,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: isSelected ? AppTheme.paper : AppTheme.primary,
            letterSpacing: 0,
          ),
        ),
      ),
    );
  }
}
