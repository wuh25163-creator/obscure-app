import 'package:flutter/material.dart';

import '../../core/app_theme.dart';
import '../../core/app_text.dart';

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
                        CustomerSignupText.title,
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
                        CustomerSignupText.subtitle,
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
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.paper,
                  border: Border.all(
                    color: AppTheme.primary,
                    width: AppStroke.regular,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: AppTheme.primary,
                      offset: AppTheme.hardShadowOffset,
                      blurRadius: 0,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F1ED),
                          border: Border.all(
                            color: AppTheme.primary.withValues(alpha: 0.2),
                            width: AppStroke.hairline,
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
                              CustomerSignupText.uploadImage,
                              style: TextStyle(
                                fontFamily: 'Space Grotesk',
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: AppTheme.primary.withValues(alpha: 0.25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      height: AppStroke.regular,
                      color: AppTheme.primary.withValues(alpha: 0.15),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildUnderlineField(
                            CustomerSignupText.name,
                            CustomerSignupText.nameHint,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildUnderlineField(
                            CustomerSignupText.phone,
                            CustomerSignupText.phoneHint,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      CustomerSignupText.requirement,
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
                          hintText: CustomerSignupText.requirementHint,
                          hintStyle: TextStyle(
                            color: AppTheme.primary.withValues(alpha: 0.3),
                            fontSize: 12,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppTheme.primary,
                              width: AppStroke.hairline,
                            ),
                            borderRadius: BorderRadius.zero,
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppTheme.accentRed,
                              width: AppStroke.regular,
                            ),
                            borderRadius: BorderRadius.zero,
                          ),
                          contentPadding: const EdgeInsets.all(10),
                          isDense: true,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () async {
                        await AppTheme.setRole(designer: false);
                        if (!context.mounted) {
                          return;
                        }
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
                            width: AppStroke.regular,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: AppTheme.accentBlue,
                              offset: AppTheme.hardShadowOffset,
                              blurRadius: 0,
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              CustomerSignupText.start,
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
              borderSide: BorderSide(
                color: AppTheme.primary,
                width: AppStroke.hairline,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.accentRed,
                width: AppStroke.regular,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 6),
            isDense: true,
          ),
        ),
      ],
    );
  }
}
