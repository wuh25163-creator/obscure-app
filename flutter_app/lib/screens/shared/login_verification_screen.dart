import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../core/app_icons.dart';

class LoginVerificationScreen extends StatefulWidget {
  const LoginVerificationScreen({super.key});

  @override
  State<LoginVerificationScreen> createState() => _LoginVerificationScreenState();
}

class _LoginVerificationScreenState extends State<LoginVerificationScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _passwordController = TextEditingController();
  int _passwordLength = 0;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() { _passwordLength = _passwordController.text.length; });
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Title ──────────────────────────────
              const Text(
                '登入 LOGIN',
                style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 26, letterSpacing: 0),
              ),
              const SizedBox(height: 2),
              Text(
                '輸入訪問憑證 ENTER ACCESS CREDENTIALS',
                style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 9, fontWeight: FontWeight.bold, color: AppTheme.primary.withValues(alpha: 0.5), letterSpacing: 0),
              ),
              const SizedBox(height: 12),

              // ── Phone Number ────────────────────────
              const Text('手機號碼 MOBILE NUMBER', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 0)),
              const SizedBox(height: 4),
              TextField(
                keyboardType: TextInputType.phone,
                style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14),
                decoration: InputDecoration(
                  hintText: '+886 0900 000 000',
                  hintStyle: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.primary.withValues(alpha: 0.3)),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.primary, width: 2), borderRadius: BorderRadius.zero),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.accentRed, width: 2), borderRadius: BorderRadius.zero),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 8),

              // ── OTP Button ──────────────────────────
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  color: AppTheme.accentRed,
                  alignment: Alignment.center,
                  child: const Text('發送驗證碼 SEND OTP', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 14, color: Colors.white, letterSpacing: 0)),
                ),
              ),
              const SizedBox(height: 8),

              // ── OTP Verification Input ───────────────
              TextField(
                keyboardType: TextInputType.number,
                style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14),
                decoration: InputDecoration(
                  hintText: '輸入驗證碼',
                  hintStyle: TextStyle(fontFamily: 'Space Grotesk', fontSize: 13, color: AppTheme.primary.withValues(alpha: 0.3)),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.primary, width: 2), borderRadius: BorderRadius.zero),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.accentRed, width: 2), borderRadius: BorderRadius.zero),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 10),

              // ── Social Icons (4 equal boxes) ─────────
              Row(
                children: [
                  Expanded(child: _buildSocialIcon(AppIcons.google(size: 24))),
                  const SizedBox(width: 8),
                  Expanded(child: _buildSocialIcon(AppIcons.apple(size: 24))),
                  const SizedBox(width: 8),
                  Expanded(child: _buildSocialIcon(AppIcons.instagram(size: 24))),
                  const SizedBox(width: 8),
                  Expanded(child: _buildSocialIcon(AppIcons.threads(size: 24))),
                ],
              ),
              const SizedBox(height: 10),

              // ── Divider ─────────────────────────────
              const Divider(color: AppTheme.primary, thickness: 1.5),
              const SizedBox(height: 10),

              // ── Email ────────────────────────────────
              const Text('電子郵件 EMAIL', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 0)),
              const SizedBox(height: 4),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14),
                decoration: InputDecoration(
                  hintText: 'USER@OBSCURE.IO',
                  hintStyle: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.primary.withValues(alpha: 0.3)),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.primary, width: 2), borderRadius: BorderRadius.zero),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.accentRed, width: 2), borderRadius: BorderRadius.zero),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 8),

              // ── Password ─────────────────────────────
              const Text('密碼 PASSWORD', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 0)),
              const SizedBox(height: 4),
              TextField(
                obscureText: !_isPasswordVisible,
                controller: _passwordController,
                style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14),
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
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  isDense: true,
                ),
              ),
              const SizedBox(height: 4),
              _buildStrengthMeter(),
              const SizedBox(height: 10),

              // ── Login Button ─────────────────────────
              GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, '/identity_selection'),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppTheme.primary, width: 2),
                    boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(3, 3))],
                  ),
                  alignment: Alignment.center,
                  child: const Text('登入', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 16, letterSpacing: 0)),
                ),
              ),
              const SizedBox(height: 8),

              // ── Footer ───────────────────────────────
              Row(
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
              ),
              const SizedBox(height: 10),

              // ── Security Banner ───────────────────────
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppTheme.primary, width: 2),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      color: AppTheme.primary,
                      child: const Icon(Icons.security, color: Colors.white, size: 14),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        '系統狀態：已加密且驗證中',
                        style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0),
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

  Widget _buildSocialIcon(Widget iconWidget) {
    return Container(
      height: 40,
      decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 1.5), color: Colors.white),
      alignment: Alignment.center,
      child: iconWidget,
    );
  }

  Widget _buildStrengthMeter() {
    int strengthLevel = 0;
    if (_passwordLength > 0 && _passwordLength <= 4) { strengthLevel = 1; }
    else if (_passwordLength > 4 && _passwordLength < 8) { strengthLevel = 2; }
    else if (_passwordLength >= 8) { strengthLevel = 4; }

    String strengthText = '';
    Color strengthColor = AppTheme.primary.withValues(alpha: 0.15);
    if (strengthLevel == 1) { strengthText = '弱'; strengthColor = AppTheme.accentRed; }
    else if (strengthLevel == 2) { strengthText = '中'; strengthColor = AppTheme.accentYellow; }
    else if (strengthLevel == 4) { strengthText = '強'; strengthColor = AppTheme.accentBlue; }

    if (_passwordLength == 0) { return const SizedBox.shrink(); }

    return Row(
      children: [
        Expanded(child: Container(height: 4, color: strengthLevel >= 1 ? strengthColor : AppTheme.primary.withValues(alpha: 0.1))),
        const SizedBox(width: 4),
        Expanded(child: Container(height: 4, color: strengthLevel >= 2 ? strengthColor : AppTheme.primary.withValues(alpha: 0.1))),
        const SizedBox(width: 4),
        Expanded(child: Container(height: 4, color: strengthLevel >= 4 ? strengthColor : AppTheme.primary.withValues(alpha: 0.1))),
        const SizedBox(width: 4),
        Expanded(child: Container(height: 4, color: strengthLevel >= 4 ? strengthColor : AppTheme.primary.withValues(alpha: 0.1))),
        const SizedBox(width: 8),
        Text(strengthText, style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.bold, color: strengthColor, letterSpacing: 0)),
      ],
    );
  }
}
