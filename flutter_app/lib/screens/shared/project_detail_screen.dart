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
      height: 52,
      decoration: const BoxDecoration(
        color: AppTheme.background,
        border: Border(bottom: BorderSide(color: AppTheme.primary, width: 2.5)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('回味', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, height: 1.2)),
              Text('鮭魚', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w500, fontSize: 11)),
            ],
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppTheme.accentYellow,
                border: Border.all(color: AppTheme.primary, width: 2),
                boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(3, 3))],
              ),
              child: const Icon(Icons.close, color: AppTheme.primary, size: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainVisual() {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        decoration: const BoxDecoration(
          color: AppTheme.accentBlue,
          border: Border(bottom: BorderSide(color: AppTheme.primary, width: 2.5)),
        ),
      ),
    );
  }

  Widget _buildProjectInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('回味', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: -0.5)),
          const SizedBox(height: 2),
          Text('2025/5/5', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, color: AppTheme.primary.withValues(alpha: 0.6))),
        ],
      ),
    );
  }

  Widget _buildCommentsSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      padding: const EdgeInsets.all(12),
      decoration: const NeoBoxDecoration(color: AppTheme.surface),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('評論', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: -0.5)),
              const SizedBox(height: 10),
              _buildCommentItem('這幾何構成非常有張力！', AppTheme.accentRed),
              const SizedBox(height: 8),
              _buildCommentItem('色彩運用很到位，學習了。', AppTheme.accentBlue),
              const SizedBox(height: 8),
              _buildCommentItem('很棒的包裝設計概念。', AppTheme.accentYellow),
              const SizedBox(height: 32),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: AppTheme.accentYellow,
                border: Border.all(color: AppTheme.primary, width: 2),
                boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(2, 2))],
              ),
              child: const Text('所有評論', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12, decoration: TextDecoration.underline)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(String text, Color color) {
    return Container(
      decoration: BoxDecoration(border: Border(left: BorderSide(color: color, width: 3))),
      padding: const EdgeInsets.only(left: 8),
      child: Text(text, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildCommentInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 42,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(color: Colors.white, border: Border.all(color: AppTheme.primary, width: 2)),
              alignment: Alignment.centerLeft,
              child: Text('輸入評論...', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.primary.withValues(alpha: 0.4))),
            ),
          ),
          Container(
            width: 52,
            height: 42,
            decoration: const BoxDecoration(
              color: AppTheme.primary,
              border: Border(top: BorderSide(color: AppTheme.primary, width: 2), right: BorderSide(color: AppTheme.primary, width: 2), bottom: BorderSide(color: AppTheme.primary, width: 2)),
            ),
            child: const Icon(Icons.send, color: Colors.white, size: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthorInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('作者/團隊', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: -0.5)),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.accentYellow,
                  border: Border.all(color: AppTheme.primary, width: 2),
                  boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(3, 3))],
                ),
              ),
              const SizedBox(width: 10),
              const Text('鮭魚', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 15)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildTag('#台式', AppTheme.accentRed),
              const SizedBox(width: 6),
              _buildTag('#包裝', AppTheme.accentBlue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text, Color borderColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        border: Border.all(color: borderColor, width: 2),
        boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(3, 3))],
      ),
      child: Text(text, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }

  Widget _buildRecommendations() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 14),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Row(
          children: [
            _buildRecCard(AppTheme.accentRed),
            const SizedBox(width: 10),
            _buildRecCard(AppTheme.accentYellow),
            const SizedBox(width: 10),
            _buildRecCard(AppTheme.accentBlue),
            const SizedBox(width: 14),
          ],
        ),
      ),
    );
  }

  Widget _buildRecCard(Color color) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: AppTheme.primary, width: 2),
        boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(3, 3))],
      ),
      child: const AspectRatio(aspectRatio: 4 / 3, child: SizedBox()),
    );
  }

  Widget _buildFooterMetrics() {
    return Container(
      margin: const EdgeInsets.fromLTRB(14, 20, 14, 24),
      padding: const EdgeInsets.all(14),
      decoration: const NeoBoxDecoration(color: AppTheme.surface),
      child: Column(
        children: [
          _buildMetricRow(Icons.favorite, '按讚', '342', AppTheme.accentRed, true),
          const SizedBox(height: 12),
          _buildMetricRow(Icons.near_me, '觀看', '1.2k', AppTheme.primary, true),
          const SizedBox(height: 12),
          _buildMetricRow(Icons.chat_bubble, '留言', '3', AppTheme.primary, false),
        ],
      ),
    );
  }

  Widget _buildMetricRow(IconData icon, String label, String value, Color iconColor, bool hasBorder) {
    return Container(
      padding: hasBorder ? const EdgeInsets.only(bottom: 6) : EdgeInsets.zero,
      decoration: hasBorder ? const BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.primary, width: 1.5))) : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 18),
              const SizedBox(width: 10),
              Text(label, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
          Text(value, style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 16)),
        ],
      ),
    );
  }
}
