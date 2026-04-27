import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../core/neo_button.dart';
import '../../core/app_icons.dart';

class LoginVerificationScreen extends StatefulWidget {
  const LoginVerificationScreen({super.key});

  @override
  State<LoginVerificationScreen> createState() => _LoginVerificationScreenState();
}

class _LoginVerificationScreenState extends State<LoginVerificationScreen> {
  bool _usePhone = true;
  bool _isPasswordVisible = false;
  final TextEditingController _passwordController = TextEditingController();
  int _passwordLength = 0;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _passwordLength = _passwordController.text.length;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Login Card
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(18.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppTheme.primary, width: 2.5),
                    boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(4, 4))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        '登入 LOGIN',
                        style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '輸入訪問憑證 ENTER ACCESS CREDENTIALS',
                        style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 9, fontWeight: FontWeight.bold, color: AppTheme.primary.withValues(alpha: 0.6)),
                      ),
                      const SizedBox(height: 14),

                      // Tab switcher
                      Row(
                        children: [
                          _buildTab('手機號碼', _usePhone, () => setState(() => _usePhone = true)),
                          const SizedBox(width: 6),
                          _buildTab('電子郵件', !_usePhone, () => setState(() => _usePhone = false)),
                        ],
                      ),
                      const SizedBox(height: 14),

                      // Content based on tab
                      Expanded(
                        child: _usePhone ? _buildPhoneSection() : _buildEmailSection(),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Security banner
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppTheme.accentRed,
                  border: Border.all(color: AppTheme.primary, width: 2),
                  boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(3, 3))],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      color: Colors.white,
                      child: const Icon(Icons.security, color: AppTheme.primary, size: 16),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        '系統狀態：已加密且驗證中',
                        style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0),
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

  Widget _buildTab(String label, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.primary : Colors.transparent,
          border: Border.all(color: AppTheme.primary, width: 1.5),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: isActive ? Colors.white : AppTheme.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Phone field
        const Text('手機號碼 MOBILE NUMBER', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 0)),
        const SizedBox(height: 4),
        TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            hintText: '+886 0900 000 000',
            hintStyle: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.primary.withValues(alpha: 0.3)),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.primary, width: 2), borderRadius: BorderRadius.zero),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.accentRed, width: 2), borderRadius: BorderRadius.zero),
            suffixIcon: Center(child: AppIcons.smartphone(color: AppTheme.accentRed, size: 20)),
            suffixIconConstraints: const BoxConstraints(maxWidth: 40, maxHeight: 40),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            isDense: true,
          ),
          style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 10),

        // OTP Button
        NeoButton(
          onTap: () {},
          color: AppTheme.accentRed,
          shadowColor: AppTheme.primary,
          depth: 3.0,
          child: Container(
            height: 42,
            alignment: Alignment.center,
            child: const Text('發送驗證碼 SEND OTP', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 13, fontWeight: FontWeight.w900, color: Colors.white)),
          ),
        ),
        const SizedBox(height: 14),

        // Social Logins
        _buildSocialRow(),
        const Spacer(),

        // Login button
        NeoButton(
          onTap: () => Navigator.pushReplacementNamed(context, '/identity_selection'),
          color: AppTheme.primary,
          shadowColor: AppTheme.accentRed,
          depth: 4.0,
          child: Container(
            height: 46,
            alignment: Alignment.center,
            child: const Text('登入', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 16, fontWeight: FontWeight.w900, color: Colors.white)),
          ),
        ),
        const SizedBox(height: 10),
        _buildFooterLinks(),
      ],
    );
  }

  Widget _buildEmailSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Email field
        const Text('電子郵件 EMAIL', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 0)),
        const SizedBox(height: 4),
        TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'USER@OBSCURE.IO',
            hintStyle: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.primary.withValues(alpha: 0.3)),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.primary, width: 2), borderRadius: BorderRadius.zero),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.accentRed, width: 2), borderRadius: BorderRadius.zero),
            suffixIcon: AppIcons.at(color: AppTheme.accentRed, size: 20),
            suffixIconConstraints: const BoxConstraints(minWidth: 36),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            isDense: true,
          ),
          style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 10),

        // Password field
        const Text('密碼 PASSWORD', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 0)),
        const SizedBox(height: 4),
        TextField(
          obscureText: !_isPasswordVisible,
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: '輸入至少 8 個字元',
            hintStyle: TextStyle(fontFamily: 'Space Grotesk', fontSize: 13, color: AppTheme.primary.withValues(alpha: 0.3)),
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.primary, width: 2), borderRadius: BorderRadius.zero),
            focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.accentRed, width: 2), borderRadius: BorderRadius.zero),
            suffixIcon: GestureDetector(
              onTap: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
              child: Center(child: _isPasswordVisible ? AppIcons.eye(color: AppTheme.primary, size: 20) : AppIcons.eyeOff(color: AppTheme.primary, size: 20)),
            ),
            suffixIconConstraints: const BoxConstraints(maxWidth: 40, maxHeight: 40),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            isDense: true,
          ),
          style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        _buildStrengthMeter(),
        const SizedBox(height: 10),

        // Social Logins
        _buildSocialRow(),
        const Spacer(),

        // Login button
        NeoButton(
          onTap: () => Navigator.pushReplacementNamed(context, '/identity_selection'),
          color: AppTheme.primary,
          shadowColor: AppTheme.accentRed,
          depth: 4.0,
          child: Container(
            height: 46,
            alignment: Alignment.center,
            child: const Text('登入', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 16, fontWeight: FontWeight.w900, color: Colors.white)),
          ),
        ),
        const SizedBox(height: 10),
        _buildFooterLinks(),
      ],
    );
  }

  Widget _buildSocialRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSocialIcon(AppIcons.google(size: 22)),
        _buildSocialIcon(AppIcons.apple(size: 22)),
        _buildSocialIcon(AppIcons.instagram(size: 22)),
        _buildSocialIcon(AppIcons.threads(size: 22)),
        _buildSocialIcon(AppIcons.line(size: 22)),
      ],
    );
  }

  Widget _buildSocialIcon(Widget iconWidget) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 1.5), color: Colors.white),
      alignment: Alignment.center,
      child: iconWidget,
    );
  }

  Widget _buildFooterLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('忘記密碼？', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 12, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationThickness: 1.5, letterSpacing: 0)),
        RichText(
          text: const TextSpan(
            style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primary, letterSpacing: 0),
            children: [
              TextSpan(text: '新用戶？ '),
              TextSpan(text: '申請存取', style: TextStyle(color: AppTheme.accentBlue)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStrengthMeter() {
    int strengthLevel = 0;
    if (_passwordLength > 0 && _passwordLength <= 4) strengthLevel = 1;
    else if (_passwordLength > 4 && _passwordLength < 8) strengthLevel = 2;
    else if (_passwordLength >= 8) strengthLevel = 4;

    String strengthText = '無';
    Color strengthColor = AppTheme.primary.withValues(alpha: 0.3);
    if (strengthLevel == 1) { strengthText = '弱'; strengthColor = AppTheme.accentRed; }
    else if (strengthLevel == 2) { strengthText = '中'; strengthColor = AppTheme.accentYellow; }
    else if (strengthLevel == 4) { strengthText = '強'; strengthColor = AppTheme.accentBlue; }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('安全強度', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0)),
            Text(strengthText, style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.bold, color: strengthColor, letterSpacing: 0)),
          ],
        ),
        const SizedBox(height: 3),
        Row(
          children: [
            Expanded(child: Container(height: 6, decoration: BoxDecoration(color: strengthLevel >= 1 ? strengthColor : AppTheme.primary.withValues(alpha: 0.1), border: Border.all(color: AppTheme.primary)))),
            const SizedBox(width: 6),
            Expanded(child: Container(height: 6, decoration: BoxDecoration(color: strengthLevel >= 2 ? strengthColor : AppTheme.primary.withValues(alpha: 0.1), border: Border.all(color: AppTheme.primary)))),
            const SizedBox(width: 6),
            Expanded(child: Container(height: 6, decoration: BoxDecoration(color: strengthLevel >= 4 ? strengthColor : AppTheme.primary.withValues(alpha: 0.1), border: Border.all(color: AppTheme.primary)))),
            const SizedBox(width: 6),
            Expanded(child: Container(height: 6, decoration: BoxDecoration(color: strengthLevel >= 4 ? strengthColor : AppTheme.primary.withValues(alpha: 0.1), border: Border.all(color: AppTheme.primary)))),
          ],
        ),
      ],
    );
  }
}
