import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../core/neo_button.dart';

class LoginVerificationScreen extends StatelessWidget {
  const LoginVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: const ObscureAppBar(
        leading: SizedBox.shrink(),
        actions: [SizedBox.shrink()],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Login Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppTheme.primary, width: 3),
                    boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(8, 8))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        '登入 LOGIN',
                        style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 24, fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '輸入訪問憑證 ENTER ACCESS CREDENTIALS',
                        style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.primary.withValues(alpha: 0.7), letterSpacing: 0),
                      ),
                      const SizedBox(height: 24),

                      // Mobile Number Field
                      const Text(
                        '手機號碼 MOBILE NUMBER',
                        style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 0),
                      ),
                      const SizedBox(height: 4),
                      TextField(
                        decoration: InputDecoration(
                          hintText: '+886 0900 000 000',
                          hintStyle: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, color: AppTheme.primary.withValues(alpha: 0.3)),
                          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.primary, width: 2), borderRadius: BorderRadius.zero),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.accentRed, width: 2), borderRadius: BorderRadius.zero),
                          suffixIcon: const Icon(Icons.phone_iphone_outlined, color: AppTheme.accentRed),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                          isDense: true,
                        ),
                        style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),

                      NeoButton(
                        onTap: () {},
                        color: AppTheme.accentRed,
                        shadowColor: AppTheme.primary,
                        depth: 4.0,
                        child: Container(
                          height: 48,
                          alignment: Alignment.center,
                          child: const Text(
                            '發送驗證碼 SEND OTP',
                            style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 16, fontWeight: FontWeight.w900, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Social Logins
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2), color: Colors.white),
                            alignment: Alignment.center,
                            child: const Text('G', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 24, fontWeight: FontWeight.w900, color: AppTheme.primary)),
                          ),
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2), color: Colors.white),
                            alignment: Alignment.center,
                            child: const Icon(Icons.apple, size: 28, color: AppTheme.primary),
                          ),
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2), color: Colors.white),
                            alignment: Alignment.center,
                            child: const Icon(Icons.camera_alt_outlined, size: 24, color: AppTheme.primary),
                          ),
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(border: Border.all(color: AppTheme.primary, width: 2), color: Colors.white),
                            alignment: Alignment.center,
                            child: const Icon(Icons.chat_bubble_outline, size: 24, color: AppTheme.primary),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Divider
                      Row(
                        children: [
                          Expanded(child: Container(height: 2, color: AppTheme.primary)),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text('或使用電子郵件 OR EMAIL', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.w900, color: AppTheme.primary)),
                          ),
                          Expanded(child: Container(height: 2, color: AppTheme.primary)),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Email Field
                      const Text(
                        '電子郵件 EMAIL ADDRESS',
                        style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 0),
                      ),
                      const SizedBox(height: 4),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'USER@OBSCURE.IO',
                          hintStyle: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, color: AppTheme.primary.withValues(alpha: 0.3)),
                          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.primary, width: 2), borderRadius: BorderRadius.zero),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.accentRed, width: 2), borderRadius: BorderRadius.zero),
                          suffixIcon: const Text('@', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 24, fontWeight: FontWeight.w900, color: AppTheme.accentRed)),
                          suffixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 0),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                          isDense: true,
                        ),
                        style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'ⓘ 格式偵測錯誤 INVALID FORMAT DETECTION',
                        style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.accentRed),
                      ),
                      const SizedBox(height: 16),

                      // Password Field
                      const Text(
                        '密碼 PASSWORD',
                        style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 0),
                      ),
                      const SizedBox(height: 4),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: '••••••••••••',
                          hintStyle: TextStyle(color: AppTheme.primary.withValues(alpha: 0.3)),
                          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.primary, width: 2), borderRadius: BorderRadius.zero),
                          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: AppTheme.accentRed, width: 2), borderRadius: BorderRadius.zero),
                          suffixIcon: const Icon(Icons.visibility_off, color: AppTheme.primary),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                          isDense: true,
                        ),
                        style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),

                      // Strength Meter
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('安全性強度', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0)),
                          Text('弱', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.accentRed, letterSpacing: 0)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(child: Container(height: 8, decoration: BoxDecoration(color: AppTheme.accentRed, border: Border.all(color: AppTheme.primary)))),
                          const SizedBox(width: 8),
                          Expanded(child: Container(height: 8, decoration: BoxDecoration(color: AppTheme.primary.withValues(alpha: 0.1), border: Border.all(color: AppTheme.primary)))),
                          const SizedBox(width: 8),
                          Expanded(child: Container(height: 8, decoration: BoxDecoration(color: AppTheme.primary.withValues(alpha: 0.1), border: Border.all(color: AppTheme.primary)))),
                          const SizedBox(width: 8),
                          Expanded(child: Container(height: 8, decoration: BoxDecoration(color: AppTheme.primary.withValues(alpha: 0.1), border: Border.all(color: AppTheme.primary)))),
                        ],
                      ),
                      const SizedBox(height: 48),

                      NeoButton(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/identity_selection');
                        },
                        color: AppTheme.primary,
                        shadowColor: AppTheme.accentRed,
                        depth: 8.0,
                        child: Container(
                          height: 64,
                          alignment: Alignment.center,
                          child: const Text(
                            '登入',
                            style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white),
                          ),
                        ),
                      ),

                      const SizedBox(height: 48),
                      const Text('忘記存取密鑰？', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 14, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationThickness: 2, letterSpacing: 0)),
                      const SizedBox(height: 16),
                      Container(height: 2, width: 48, color: AppTheme.primary),
                      const SizedBox(height: 16),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.primary, letterSpacing: 0),
                          children: [
                            TextSpan(text: '新用戶？ '),
                            TextSpan(text: '申請存取權限', style: TextStyle(color: AppTheme.accentBlue)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Verification Ticker
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.accentRed,
                    border: Border.all(color: AppTheme.primary, width: 3),
                    boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(4, 4))],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.white,
                        child: const Icon(Icons.security, color: AppTheme.primary),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                          child: Text(
                            '系統狀態：\n已加密且驗證中',
                            style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white, height: 1.3, letterSpacing: 0.5),
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
