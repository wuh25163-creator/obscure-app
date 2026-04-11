import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildMainVisual(),
                    _buildProjectInfo(),
                    _buildCommentsSection(),
                    _buildCommentInput(),
                    _buildAuthorInfo(),
                    _buildRecommendations(),
                    _buildFooterMetrics(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 64,
      decoration: const BoxDecoration(
        color: AppTheme.background,
        border: Border(bottom: BorderSide(color: AppTheme.primary, width: 4)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '回味',
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1.2,
                ),
              ),
              Text(
                '鮭魚',
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.accentYellow,
                border: Border.all(color: AppTheme.primary, width: 4),
                boxShadow: const [
                  BoxShadow(
                    color: AppTheme.primary,
                    offset: Offset(4, 4),
                    blurRadius: 0,
                  ),
                ],
              ),
              child: const Icon(Icons.close, color: AppTheme.primary),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainVisual() {
    return AspectRatio(
      aspectRatio: 4 / 5,
      child: Container(
        decoration: const BoxDecoration(
          color: AppTheme.accentBlue,
          border: Border(bottom: BorderSide(color: AppTheme.primary, width: 4)),
        ),
      ),
    );
  }

  Widget _buildProjectInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '回味',
            style: TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.bold,
              fontSize: 32,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '2025/5/5',
            style: TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: AppTheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      padding: const EdgeInsets.all(16.0),
      decoration: const NeoBoxDecoration(color: AppTheme.surface),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '評論',
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 12),
              _buildCommentItem('這幾何構成非常有張力！', AppTheme.accentRed),
              const SizedBox(height: 12),
              _buildCommentItem('色彩運用很到位，學習了。', AppTheme.accentBlue),
              const SizedBox(height: 12),
              _buildCommentItem('很棒的包裝設計概念。', AppTheme.accentYellow),
              const SizedBox(height: 40), // Space for button
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppTheme.accentYellow,
                border: Border.all(color: AppTheme.primary, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: AppTheme.primary,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: const Text(
                '所有評論',
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(String text, Color color) {
    return Container(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: color, width: 4)),
      ),
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCommentInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppTheme.primary, width: 4),
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                '輸入評論...',
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primary.withValues(alpha: 0.4),
                ),
              ),
            ),
          ),
          Container(
            width: 64,
            height: 48,
            decoration: const BoxDecoration(
              color: AppTheme.primary,
              border: Border(
                top: BorderSide(color: AppTheme.primary, width: 4),
                right: BorderSide(color: AppTheme.primary, width: 4),
                bottom: BorderSide(color: AppTheme.primary, width: 4),
                left: BorderSide.none,
              ),
            ),
            child: const Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthorInfo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '作者/團隊',
            style: TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.accentYellow,
                  border: Border.all(color: AppTheme.primary, width: 4),
                  boxShadow: const [
                    BoxShadow(
                      color: AppTheme.primary,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                '鮭魚',
                style: TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildTag('#台式', AppTheme.accentRed),
              const SizedBox(width: 8),
              _buildTag('#包裝', AppTheme.accentBlue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, Color borderColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: borderColor, width: 4),
        boxShadow: const [
          BoxShadow(
            color: AppTheme.primary,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Space Grotesk',
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildRecommendations() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Row(
          children: [
            _buildRecCard(AppTheme.accentRed),
            const SizedBox(width: 16),
            _buildRecCard(AppTheme.accentYellow),
            const SizedBox(width: 16),
            _buildRecCard(AppTheme.accentBlue),
            const SizedBox(width: 16), // trailing padding
          ],
        ),
      ),
    );
  }

  Widget _buildRecCard(Color color) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: AppTheme.primary, width: 4),
        boxShadow: const [
          BoxShadow(
            color: AppTheme.primary,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: const AspectRatio(
        aspectRatio: 4 / 3,
        child: SizedBox(),
      ),
    );
  }

  Widget _buildFooterMetrics() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 48, 16, 32),
      padding: const EdgeInsets.all(24),
      decoration: const NeoBoxDecoration(color: AppTheme.surface),
      child: Column(
        children: [
          _buildMetricRow(Icons.favorite, '按讚', '342', AppTheme.accentRed, true),
          const SizedBox(height: 16),
          _buildMetricRow(Icons.near_me, '觀看', '1.2k', AppTheme.primary, true),
          const SizedBox(height: 16),
          _buildMetricRow(Icons.chat_bubble, '留言', '3', AppTheme.primary, false),
        ],
      ),
    );
  }

  Widget _buildMetricRow(IconData icon, String label, String value, Color iconColor, bool hasBorder) {
    return Container(
      padding: hasBorder ? const EdgeInsets.only(bottom: 8) : EdgeInsets.zero,
      decoration: hasBorder
          ? const BoxDecoration(
              border: Border(bottom: BorderSide(color: AppTheme.primary, width: 2)),
            )
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor),
              const SizedBox(width: 16),
              Text(
                label,
                style: const TextStyle(
                  fontFamily: 'Space Grotesk',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.w900,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
