import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class FolderProjectCard extends StatelessWidget {
  final String projectName;
  final String concept;
  final List<String> tags;
  final Color tabColor;
  final Color bodyColor;

  const FolderProjectCard({
    super.key,
    required this.projectName,
    required this.concept,
    this.tags = const [],
    this.tabColor = AppTheme.accentRed,
    this.bodyColor = AppTheme.surface,
  });

  @override
  Widget build(BuildContext context) {
    // We use a LayoutBuilder so we can measure constraints if needed,
    // but IntrinsicWidth on the tab works better for dynamic text.
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main Body
          Container(
            margin: const EdgeInsets.only(top: 46), // Adjust for tab height
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            decoration: BoxDecoration(
              color: bodyColor,
              border: Border.all(color: AppTheme.primary, width: 3),
              boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(4, 4))],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  concept,
                  style: const TextStyle(
                    fontFamily: 'Space Grotesk',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    height: 1.6,
                    color: AppTheme.primary,
                  ),
                ),
                if (tags.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: tags.map((t) => _buildFolderTag(t)).toList(),
                  )
                ]
              ],
            ),
          ),
          
          // Folder Tab
          Positioned(
            top: 0,
            left: 0,
            child: IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: tabColor,
                      border: const Border(
                        top: BorderSide(color: AppTheme.primary, width: 3),
                        left: BorderSide(color: AppTheme.primary, width: 3),
                        right: BorderSide(color: AppTheme.primary, width: 3),
                      ),
                    ),
                    child: Text(
                      projectName,
                      style: TextStyle(
                        color: (tabColor == AppTheme.primary || tabColor == AppTheme.accentBlue || tabColor == AppTheme.accentRed) ? Colors.white : AppTheme.primary,
                        fontFamily: 'Space Grotesk',
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  // Small connecting block to cover the top border of the main body
                  Container(
                    height: 3,
                    margin: const EdgeInsets.only(left: 3, right: 3), // indent to keep left/right borders visible
                    color: tabColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFolderTag(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppTheme.primary, width: 2),
      ),
      child: Text(
        tag,
        style: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 12,
          fontFamily: 'Space Grotesk',
        ),
      ),
    );
  }
}
