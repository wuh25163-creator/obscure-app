import 'package:flutter/material.dart';

import '../../core/app_icons.dart';
import '../../core/app_theme.dart';

const double _loginInputHeight = 31;
const double _loginButtonHeight = 33;
const double _loginSocialHeight = 61;
const double _loginFrameWidth = 300;

class LoginVerificationScreen extends StatefulWidget {
  const LoginVerificationScreen({super.key});

  @override
  State<LoginVerificationScreen> createState() =>
      _LoginVerificationScreenState();
}

class _LoginVerificationScreenState extends State<LoginVerificationScreen> {
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, AppSpace.base),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final frameWidth = constraints.maxWidth < _loginFrameWidth
                  ? constraints.maxWidth
                  : _loginFrameWidth;

              return Center(
                child: SizedBox(
                  width: frameWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(14),
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
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 262),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  '登入 LOGIN',
                                  style: TextStyle(
                                    fontFamily: 'Space Grotesk',
                                    fontWeight: FontWeight.w900,
                                    fontSize: AppTypeScale.section,
                                    height: AppLineHeight.title,
                                    letterSpacing: AppTracking.none,
                                  ),
                                ),
                                const SizedBox(height: AppSpace.md),
                                Text(
                                  '輸入訪問憑證 ENTER ACCESS CREDENTIALS',
                                  style: TextStyle(
                                    fontFamily: 'Space Grotesk',
                                    fontSize: AppTypeScale.micro,
                                    fontWeight: FontWeight.w700,
                                    height: AppLineHeight.snug,
                                    color: AppTheme.primary.withValues(
                                      alpha: 0.5,
                                    ),
                                    letterSpacing: AppTracking.none,
                                  ),
                                ),
                                const SizedBox(height: AppSpace.sectionGap),
                                const _FieldLabel('手機號碼 MOBILE NUMBER'),
                                const SizedBox(height: AppSpace.xs),
                                _NeoLoginField(
                                  keyboardType: TextInputType.phone,
                                  hintText: '+886 0900 000 000',
                                ),
                                const SizedBox(height: AppSpace.base),
                                _LoginActionButton(
                                  label: '發送驗證碼 SEND OTP',
                                  color: AppTheme.accentRed,
                                  textColor: AppTheme.paper,
                                  hasShadow: true,
                                  onTap: () {},
                                ),
                                const SizedBox(height: AppSpace.base),
                                const _NeoLoginField(
                                  keyboardType: TextInputType.number,
                                  hintText: '輸入驗證碼',
                                ),
                                const SizedBox(height: AppSpace.base),
                                const Divider(
                                  color: AppTheme.primary,
                                  thickness: AppStroke.regular,
                                ),
                                const SizedBox(height: AppSpace.compact),
                                LayoutBuilder(
                                  builder: (context, constraints) {
                                    const gap = AppSpace.md2;
                                    final socialSize =
                                        ((constraints.maxWidth - gap * 3) / 4)
                                            .clamp(0.0, _loginSocialHeight);

                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _buildSocialIcon(
                                          AppIcons.google(size: 22),
                                          size: socialSize,
                                        ),
                                        const SizedBox(width: gap),
                                        _buildSocialIcon(
                                          AppIcons.apple(size: 22),
                                          size: socialSize,
                                        ),
                                        const SizedBox(width: gap),
                                        _buildSocialIcon(
                                          AppIcons.instagram(size: 22),
                                          size: socialSize,
                                        ),
                                        const SizedBox(width: gap),
                                        _buildSocialIcon(
                                          AppIcons.threads(size: 22),
                                          size: socialSize,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                                const SizedBox(height: AppSpace.base),
                                const Divider(
                                  color: AppTheme.primary,
                                  thickness: AppStroke.regular,
                                ),
                                const SizedBox(height: AppSpace.base),
                                const _FieldLabel('電子郵件 EMAIL'),
                                const SizedBox(height: AppSpace.sm),
                                _NeoLoginField(
                                  keyboardType: TextInputType.emailAddress,
                                  hintText: 'USER@OBSCURE.IO',
                                ),
                                const SizedBox(height: AppSpace.base),
                                const _FieldLabel('密碼 PASSWORD'),
                                const SizedBox(height: AppSpace.sm),
                                _NeoLoginField(
                                  controller: _passwordController,
                                  obscureText: !_isPasswordVisible,
                                  hintText: '輸入密碼',
                                  suffixIcon: GestureDetector(
                                    onTap: () => setState(
                                      () => _isPasswordVisible =
                                          !_isPasswordVisible,
                                    ),
                                    child: Center(
                                      child: _isPasswordVisible
                                          ? AppIcons.eye(
                                              color: AppTheme.primary,
                                              size: 15,
                                            )
                                          : AppIcons.eyeOff(
                                              color: AppTheme.primary,
                                              size: 15,
                                            ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: AppSpace.sm),
                                _buildStrengthMeter(),
                                const SizedBox(height: AppSpace.base),
                                _LoginActionButton(
                                  label: '登入',
                                  color: AppTheme.primary,
                                  textColor: AppTheme.paper,
                                  hasShadow: true,
                                  shadowColor: AppTheme.accentRed,
                                  onTap: () => Navigator.pushReplacementNamed(
                                    context,
                                    '/identity_selection',
                                  ),
                                ),
                                const SizedBox(height: AppSpace.regular),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '忘記密碼？',
                                      style: TextStyle(
                                        fontFamily: 'Space Grotesk',
                                        fontSize: AppTypeScale.meta,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: AppStroke.regular,
                                        letterSpacing: AppTracking.none,
                                      ),
                                    ),
                                    RichText(
                                      text: const TextSpan(
                                        style: TextStyle(
                                          fontFamily: 'Space Grotesk',
                                          fontSize: AppTypeScale.meta,
                                          fontWeight: FontWeight.w700,
                                          color: AppTheme.primary,
                                          letterSpacing: AppTracking.none,
                                        ),
                                        children: [
                                          TextSpan(text: '新用戶？ '),
                                          TextSpan(
                                            text: '申請存取',
                                            style: TextStyle(
                                              color: AppTheme.accentBlue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 14),
                      _buildSecurityBanner(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(
    Widget iconWidget, {
    double size = _loginSocialHeight,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.primary, width: AppStroke.regular),
        color: AppTheme.paper,
      ),
      alignment: Alignment.center,
      child: FittedBox(child: iconWidget),
    );
  }

  Widget _buildSecurityBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpace.base,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppTheme.accentRed,
        border: Border.all(color: AppTheme.primary, width: AppStroke.regular),
        boxShadow: const [
          BoxShadow(
            color: AppTheme.primary,
            offset: Offset(3, 3),
            blurRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpace.xs),
            color: AppTheme.paper,
            child: const Icon(
              Icons.security,
              color: AppTheme.primary,
              size: 11,
            ),
          ),
          const SizedBox(width: AppSpace.md2),
          const Expanded(
            child: Text(
              '系統狀態：已加密且驗證中',
              style: TextStyle(
                fontFamily: 'Space Grotesk',
                fontSize: AppTypeScale.tiny,
                fontWeight: FontWeight.w700,
                height: AppLineHeight.readableTight,
                color: AppTheme.onRed,
                letterSpacing: AppTracking.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStrengthMeter() {
    int strengthLevel = 0;
    if (_passwordLength > 0 && _passwordLength <= 4) {
      strengthLevel = 1;
    } else if (_passwordLength > 4 && _passwordLength < 8) {
      strengthLevel = 2;
    } else if (_passwordLength >= 8) {
      strengthLevel = 4;
    }

    String strengthText = '';
    Color strengthColor = AppTheme.primary.withValues(alpha: 0.15);
    if (strengthLevel == 1) {
      strengthText = '弱';
      strengthColor = AppTheme.accentRed;
    } else if (strengthLevel == 2) {
      strengthText = '中';
      strengthColor = AppTheme.accentYellow;
    } else if (strengthLevel == 4) {
      strengthText = '強';
      strengthColor = AppTheme.accentBlue;
    }

    if (_passwordLength == 0) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        for (var index = 1; index <= 4; index++) ...[
          Expanded(
            child: Container(
              height: 3,
              color: strengthLevel >= index
                  ? strengthColor
                  : AppTheme.primary.withValues(alpha: 0.1),
            ),
          ),
          if (index < 4) const SizedBox(width: AppSpace.sm),
        ],
        const SizedBox(width: AppSpace.base),
        Text(
          strengthText,
          style: TextStyle(
            fontFamily: 'Space Grotesk',
            fontSize: AppTypeScale.tiny,
            fontWeight: FontWeight.w700,
            color: strengthColor,
            letterSpacing: AppTracking.none,
          ),
        ),
      ],
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;

  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Space Grotesk',
        fontSize: AppTypeScale.tiny,
        fontWeight: FontWeight.w900,
        height: AppLineHeight.snug,
        letterSpacing: AppTracking.none,
      ),
    );
  }
}

class _NeoLoginField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String hintText;
  final Widget? suffixIcon;

  const _NeoLoginField({
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    required this.hintText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Builder(
        builder: (context) {
          final hasFocus = Focus.of(context).hasFocus;

          return Container(
            height: _loginInputHeight,
            decoration: BoxDecoration(
              color: AppTheme.paper,
              border: Border.all(
                color: hasFocus ? AppTheme.accentRed : AppTheme.primary,
                width: AppStroke.regular,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    keyboardType: keyboardType,
                    obscureText: obscureText,
                    textAlignVertical: TextAlignVertical.center,
                    style: const TextStyle(
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.w700,
                      fontSize: AppTypeScale.small,
                      height: AppLineHeight.snug,
                    ),
                    decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.w700,
                        fontSize: AppTypeScale.caption,
                        color: AppTheme.primary.withValues(alpha: 0.3),
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      isCollapsed: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: AppSpace.base,
                      ),
                    ),
                  ),
                ),
                if (suffixIcon != null)
                  SizedBox(
                    width: _loginInputHeight,
                    height: _loginInputHeight,
                    child: suffixIcon,
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _LoginActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;
  final bool hasShadow;
  final Color shadowColor;

  const _LoginActionButton({
    required this.label,
    required this.color,
    required this.textColor,
    required this.onTap,
    this.hasShadow = false,
    this.shadowColor = AppTheme.primary,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: _loginButtonHeight,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: AppTheme.primary, width: AppStroke.regular),
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: shadowColor,
                    offset: const Offset(3, 3),
                    blurRadius: 0,
                  ),
                ]
              : null,
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Space Grotesk',
            fontWeight: FontWeight.w900,
            fontSize: AppTypeScale.meta,
            color: textColor,
            height: AppLineHeight.snug,
            letterSpacing: AppTracking.none,
          ),
        ),
      ),
    );
  }
}
