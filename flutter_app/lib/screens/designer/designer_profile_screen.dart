import 'package:flutter/material.dart';

import '../../core/app_theme.dart';
import '../../core/neo_button.dart';

class DesignerProfileScreen extends StatelessWidget {
  const DesignerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final name = args?['name'] as String? ?? '設計師';

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: const ObscureAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 96),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontFamily: 'Space Grotesk',
                            fontWeight: FontWeight.w900,
                            fontSize: 28,
                            height: 0.98,
                            letterSpacing: 0,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: const [
                            _ProfileTag('#台式'),
                            _ProfileTag('#像素'),
                            _ProfileTag('#BRUTALIST'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 88,
                        height: 100,
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
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.person_outline,
                          size: 36,
                          color: AppTheme.primary.withValues(alpha: 0.45),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          color: AppTheme.accentRed,
                          child: const Text(
                            'NEW',
                            style: TextStyle(
                              color: AppTheme.onRed,
                              fontFamily: 'Space Grotesk',
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 7),
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
                      offset: Offset(3, 3),
                      blurRadius: 0,
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: _ProfileStat(label: '瀏覽數', value: '0'),
                    ),
                    Expanded(
                      child: _ProfileStat(label: '獲讚數', value: '0'),
                    ),
                    Expanded(
                      child: _ProfileStat(label: '追蹤數', value: '0'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: NeoButton(
                      onTap: () =>
                          Navigator.pushNamed(context, '/income_dashboard'),
                      color: AppTheme.accentYellow,
                      depth: 3,
                      borderWidth: AppStroke.regular,
                      child: const _ProfileActionLabel('收入儀錶板'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: NeoButton(
                      onTap: () => Navigator.pushNamed(context, '/new_work'),
                      color: AppTheme.primary,
                      shadowColor: AppTheme.accentBlue,
                      depth: 3,
                      borderWidth: AppStroke.regular,
                      child: const _ProfileActionLabel(
                        '新增專案',
                        color: AppTheme.paper,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                '專案閱覽',
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                  height: 1,
                  letterSpacing: 0,
                ),
              ),
              const SizedBox(height: 14),
              const _ProjectPreviewCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ObscureNavBar(
        pageContext: context,
        activeRoute: '/designer_profile',
      ),
    );
  }
}

class _ProfileTag extends StatelessWidget {
  final String text;

  const _ProfileTag(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: AppTheme.paper,
        border: Border.all(color: AppTheme.primary, width: AppStroke.regular),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Space Grotesk',
          fontSize: 8,
          fontWeight: FontWeight.w900,
          letterSpacing: 0,
        ),
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: AppTheme.primary, width: AppStroke.regular),
        ),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.w900,
              fontSize: 11,
              height: 1,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.w900,
              fontSize: 15,
              height: 1,
              letterSpacing: 0,
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileActionLabel extends StatelessWidget {
  final String text;
  final Color color;

  const _ProfileActionLabel(this.text, {this.color = AppTheme.primary});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Space Grotesk',
          fontWeight: FontWeight.w900,
          fontSize: 14,
          height: 1,
          color: color,
          letterSpacing: 0,
        ),
      ),
    );
  }
}

class _ProjectPreviewCard extends StatelessWidget {
  const _ProjectPreviewCard();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final tabStepX = constraints.maxWidth * 0.6;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 32,
              child: CustomPaint(
                painter: _SteppedTabBorderPainter(stepX: tabStepX),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '主題',
                      style: TextStyle(
                        color: AppTheme.onBlue,
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.w900,
                        fontSize: 13,
                        height: 1,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -AppStroke.regular),
              child: Container(
                height: 76,
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
                decoration: BoxDecoration(
                  color: AppTheme.paper,
                  border: Border.all(
                    color: AppTheme.paper,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '主題詳細描述',
                      style: TextStyle(
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                        height: 1,
                        letterSpacing: 0,
                      ),
                    ),
                    const Spacer(),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: const [
                        _ProfileTag('#台式'),
                        _ProfileTag('#像素'),
                        _ProfileTag('#BRUTALIST'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SteppedTabBorderPainter extends CustomPainter {
  final double stepX;

  const _SteppedTabBorderPainter({required this.stepX});

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = AppStroke.regular;
    final halfStroke = stroke / 2;
    final stepY = size.height - 12;
    final fillPaint = Paint()
      ..color = AppTheme.accentBlue
      ..style = PaintingStyle.fill;
    final strokePaint = Paint()
      ..color = AppTheme.accentBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke;

    final fillPath = Path()
      ..moveTo(halfStroke, size.height)
      ..lineTo(halfStroke, halfStroke)
      ..lineTo(stepX, halfStroke)
      ..lineTo(stepX, stepY)
      ..lineTo(size.width - halfStroke, stepY)
      ..lineTo(size.width - halfStroke, size.height)
      ..close();
    final strokePath = Path()
      ..moveTo(halfStroke, size.height)
      ..lineTo(halfStroke, halfStroke)
      ..lineTo(stepX, halfStroke)
      ..lineTo(stepX, stepY)
      ..lineTo(size.width - halfStroke, stepY)
      ..lineTo(size.width - halfStroke, size.height);

    canvas.save();
    canvas.translate(3, 3);
    canvas.drawPath(fillPath, Paint()..color = AppTheme.primary);
    canvas.restore();
    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(strokePath, strokePaint);
  }

  @override
  bool shouldRepaint(covariant _SteppedTabBorderPainter oldDelegate) {
    return oldDelegate.stepX != stepX;
  }
}
