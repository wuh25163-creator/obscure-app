import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class ReviewRatingScreen extends StatelessWidget {
  const ReviewRatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: const ObscureAppBar(), // Assuming it's accessible or copy it here in real environment
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.accentRed,
                    border: Border.all(color: AppTheme.primary, width: 3),
                  ),
                  child: Text('專案進度：已完成', style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14, letterSpacing: 0)),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '評價您的\n專案體驗。'.toUpperCase(),
                style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 40, fontWeight: FontWeight.w900, height: 1.1, letterSpacing: 0),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: const BoxDecoration(border: Border(left: BorderSide(color: AppTheme.primary, width: 4))),
                padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: AppTheme.primary, height: 1.5, letterSpacing: 0),
                    children: [
                      TextSpan(text: '您的評價將直接影響 '),
                      TextSpan(text: 'STUDIO_NOIR', style: TextStyle(color: AppTheme.accentBlue, fontWeight: FontWeight.bold)),
                      TextSpan(text: ' 的專業檔案。請提供誠實且具建設性的意見，幫助社群成長。'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Feedback Form Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppTheme.primary, width: 3),
                  boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(6, 6))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppTheme.primary, width: 2))),
                      child: const Text('提交評價', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: 0)),
                    ),
                    const SizedBox(height: 24),

                    // Star Ratings
                    _buildRatingRow('專業程度', 4),
                    const SizedBox(height: 16),
                    _buildRatingRow('溝通表達', 5),
                    const SizedBox(height: 16),
                    _buildRatingRow('準時程度', 3),
                    const SizedBox(height: 32),

                    // Comments Text Area
                    const Text('詳細評語', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0)),
                    const SizedBox(height: 8),
                    TextField(
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: '專案執行過程如何？請具體描述...',
                        hintStyle: TextStyle(fontFamily: 'Inter', color: AppTheme.primary.withValues(alpha: 0.5)),
                        filled: true,
                        fillColor: AppTheme.surface,
                        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.primary, width: 4)),
                        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: AppTheme.accentRed, width: 4)),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Photo Upload
                    const Text('成品照片', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0)),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: AppTheme.surface,
                          border: Border.all(color: AppTheme.primary, width: 4), // dashed usually but standard flutter requires plugin/custom paint, so solid is fine for mockup
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            const Icon(Icons.add_a_photo, size: 48, color: AppTheme.primary),
                            const SizedBox(height: 8),
                            const Text('拖曳或點擊上傳', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0)),
                            Text('高解析度 PNG, JPG 或 TIFF', style: TextStyle(fontSize: 12, color: AppTheme.primary.withValues(alpha: 0.6), letterSpacing: 0)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Submit Button
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        decoration: BoxDecoration(
                          color: AppTheme.primary,
                          boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(4, 4))], // bauhaus-shadow-small
                        ),
                        alignment: Alignment.center,
                        child: const Text('送出評價', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 0)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Profile Stats Impact
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppTheme.accentBlue,
                  border: Border.all(color: AppTheme.primary, width: 3),
                  boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(6, 6))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white, width: 2))),
                      child: const Text('檔案數據影響', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 0)),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(child: _buildStatItem('聲譽值', '+14')),
                        const SizedBox(width: 16),
                        Expanded(child: _buildStatItem('信任分數', '98%')),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Live Preview/Recent Review Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppTheme.primary, width: 3),
                  boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(6, 6))],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(color: AppTheme.accentYellow, border: Border.all(color: AppTheme.primary, width: 3)),
                          child: const Icon(Icons.person),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('STUDIO_NOIR', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, letterSpacing: 0)),
                            Text('首席建築師', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primary.withValues(alpha: 0.6), letterSpacing: 0)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        border: Border.all(color: AppTheme.primary, width: 3),
                      ),
                      child: const Center(child: Icon(Icons.image, size: 48, color: Colors.white)),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      decoration: const BoxDecoration(border: Border(left: BorderSide(color: AppTheme.accentRed, width: 4))),
                      padding: const EdgeInsets.only(left: 16),
                      child: const Text('「粗獷主義樓梯的細節處理非常出色。溝通順暢，並準時交付。」', style: TextStyle(fontFamily: 'Inter', fontSize: 14, fontStyle: FontStyle.italic, letterSpacing: 0)),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: const BoxDecoration(
                        color: AppTheme.surface,
                        border: Border(left: BorderSide(color: AppTheme.accentBlue, width: 4)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('來自 STUDIO_NOIR 的回覆：', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.accentBlue, letterSpacing: 0)),
                          SizedBox(height: 4),
                          Text('「謝謝！很高興能與您合作開發如此大膽的願景。期待下一次合作。」', style: TextStyle(fontFamily: 'Inter', fontSize: 14, letterSpacing: 0)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingRow(String title, int stars) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 16, fontWeight: FontWeight.bold)),
        Row(
          children: List.generate(5, (index) {
            bool isFilled = index < stars;
            return Icon(
              isFilled ? Icons.star : Icons.star_border,
              color: isFilled ? AppTheme.accentRed : AppTheme.primary,
              size: 32,
            );
          }),
        ),
      ],
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppTheme.primary, width: 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label.toUpperCase(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primary, letterSpacing: 0)),
          Text(value, style: const TextStyle(fontFamily: 'Space Grotesk', fontSize: 24, fontWeight: FontWeight.w900, color: AppTheme.primary, letterSpacing: 0)),
        ],
      ),
    );
  }
}
