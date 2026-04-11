import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:palette_generator/palette_generator.dart';
import '../../core/app_theme.dart';
import '../../core/neo_button.dart';

class NewWorkScreen extends StatefulWidget {
  const NewWorkScreen({super.key});

  @override
  State<NewWorkScreen> createState() => _NewWorkScreenState();
}

class _NewWorkScreenState extends State<NewWorkScreen> {
  final List<String> fields = ['平面設計', '產品設計', '空間設計', '互動設計', '文創設計'];
  final List<String> selectedFields = [];

  final List<String> styles = ['#可愛', '#簡約', '#新藝術', '#流線型', '#溫馨', '#活潑', '#高彩度', '#暗黑', '#沉穩', '#高明度', '#普普風'];
  final List<String> selectedStyles = [];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _conceptController = TextEditingController();

  bool _isUploaded = false;
  bool _isAnalyzing = false;
  Uint8List? _uploadedImageBytes;
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _nameController.dispose();
    _conceptController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        final bytes = await image.readAsBytes();
        setState(() {
          _uploadedImageBytes = bytes;
          _isUploaded = true;
          _isAnalyzing = true;
          selectedStyles.clear();
        });
        await _analyzeImageStyle(bytes);
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  Future<void> _analyzeImageStyle(Uint8List bytes) async {
    try {
      // Simulate real AI processing time for UX
      await Future.delayed(const Duration(milliseconds: 1500));

      final PaletteGenerator palette = await PaletteGenerator.fromImageProvider(
        MemoryImage(bytes),
        maximumColorCount: 10,
      );

      Set<String> detectedStyles = {};

      if (palette.dominantColor != null) {
        final hsl = HSLColor.fromColor(palette.dominantColor!.color);
        if (hsl.lightness > 0.75) {
          detectedStyles.addAll(['#簡約', '#高明度']);
        } else if (hsl.lightness < 0.3) {
          detectedStyles.addAll(['#暗黑', '#沉穩']);
        }
        if (hsl.saturation > 0.6) {
          detectedStyles.addAll(['#普普風', '#高彩度']);
        }
      }

      if (palette.vibrantColor != null) {
        detectedStyles.add('#活潑');
      }

      if (palette.mutedColor != null) {
        detectedStyles.add('#溫馨');
      }
      
      if (detectedStyles.isEmpty) {
        detectedStyles.add('#新藝術'); // fallback
      }

      setState(() {
        _isAnalyzing = false;
        for (var s in detectedStyles) {
          if (!styles.contains(s)) styles.add(s);
          if (!selectedStyles.contains(s)) selectedStyles.add(s);
        }
      });
    } catch (e) {
      debugPrint("Palette Error: $e");
      setState(() {
        _isAnalyzing = false;
        if (!selectedStyles.contains('#簡約')) selectedStyles.add('#簡約');
      });
    }
  }

  Widget _buildChip(String text, List<String> selectionList) {
    final isSelected = selectionList.contains(text);
    final selectedIndex = selectionList.indexOf(text);
    
    Color bgColor = AppTheme.surface;
    Color textColor = AppTheme.primary;

    if (isSelected) {
      const colors = [
        AppTheme.accentRed,
        AppTheme.accentYellow,
        AppTheme.accentBlue,
        AppTheme.primary,
        Colors.white,
      ];
      bgColor = colors[selectedIndex % colors.length];
      textColor = (bgColor == AppTheme.primary || bgColor == AppTheme.accentBlue || bgColor == AppTheme.accentRed) 
          ? Colors.white 
          : AppTheme.primary;
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectionList.remove(text);
          } else {
            selectionList.add(text);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: AppTheme.primary, width: 2),
          boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(2, 2))],
        ),
        child: Text(
          text,
          style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 14, color: textColor),
        ),
      ),
    );
  }

  void _showAddDialog(List<String> targetList, List<String> targetSelectedList) {
    String newText = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppTheme.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
            side: const BorderSide(color: AppTheme.primary, width: 3),
          ),
          title: const Text('新增項目', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, color: AppTheme.primary)),
          content: TextField(
            autofocus: true,
            style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold),
            decoration: const InputDecoration(
              hintText: '請輸入...',
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.primary, width: 2), borderRadius: BorderRadius.zero),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppTheme.accentYellow, width: 2), borderRadius: BorderRadius.zero),
            ),
            onChanged: (val) => newText = val,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('取消', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            ),
            NeoButton(
              onTap: () {
                if (newText.trim().isNotEmpty) {
                  setState(() {
                    targetList.add(newText.trim());
                    targetSelectedList.add(newText.trim());
                  });
                }
                Navigator.pop(context);
              },
              color: AppTheme.accentYellow,
              depth: 3.0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: const Text('確認', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.primary)),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAddChip(List<String> targetList, List<String> targetSelectedList) {
    return GestureDetector(
      onTap: () => _showAddDialog(targetList, targetSelectedList),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          border: Border.all(color: AppTheme.primary, width: 2),
          boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(2, 2))],
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, size: 16, color: AppTheme.primary),
            SizedBox(width: 4),
            Text('新增', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 14)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.background,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 8),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.primary, width: 2),
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.arrow_back, color: AppTheme.primary, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: const Text('OBSCURE', style: TextStyle(fontFamily: 'Space Grotesk', color: AppTheme.primary, fontWeight: FontWeight.w900, fontSize: 24, fontStyle: FontStyle.italic)),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(color: AppTheme.primary, height: 4.0),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              '新增作品',
              style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 48, letterSpacing: -2, height: 1.1),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(top: 8, bottom: 32),
                height: 6,
                width: 96,
                color: AppTheme.accentRed,
              ),
            ),
            const Text('名稱/品名', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 18)),
            const SizedBox(height: 12),
            Container(
              decoration: const NeoBoxDecoration(color: AppTheme.surface),
              child: TextField(
                controller: _nameController,
                style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  hintText: '輸入專案名稱...',
                  hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 32),

            const Text('相關領域', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 18)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ...fields.map((f) => _buildChip(f, selectedFields)),
                _buildAddChip(fields, selectedFields),
              ],
            ),
            const SizedBox(height: 32),

            // Dashed border container
            Stack(
              children: [
                Positioned.fill(
                   child: Transform.translate(
                     offset: const Offset(4, 4),
                     child: Container(color: AppTheme.primary),
                   ),
                ),
                GestureDetector(
                  onTap: _pickImage,
                  child: CustomPaint(
                    painter: DashedRectPainter(color: AppTheme.primary, strokeWidth: 3, gap: 12),
                    child: Container(
                      height: 240,
                      width: double.infinity,
                      color: AppTheme.surface,
                      child: _isAnalyzing
                          ? const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(color: AppTheme.primary),
                                SizedBox(height: 24),
                                Text('🤖 正在透過視覺分析風格...', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.primary)),
                              ],
                            )
                          : _uploadedImageBytes != null
                              ? Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.memory(_uploadedImageBytes!, fit: BoxFit.cover),
                                    Container(
                                      color: Colors.black.withValues(alpha: 0.4),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.check_circle_outline, size: 48, color: AppTheme.accentYellow),
                                        const SizedBox(height: 16),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                          color: AppTheme.primary,
                                          child: const Text('更換圖片', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, color: Colors.white)),
                                        )
                                      ],
                                    ),
                                  ],
                                )
                              : const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_photo_alternate_outlined, size: 48, color: AppTheme.primary),
                                    SizedBox(height: 16),
                                    Text('拖曳或點擊上傳圖片', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold, color: AppTheme.primary)),
                                  ],
                                ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            if (_isUploaded) ...[
              const Text('風格標籤', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 18)),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  ...styles.map((s) => _buildChip(s, selectedStyles)),
                  _buildAddChip(styles, selectedStyles),
                ],
              ),
              const SizedBox(height: 32),
            ],

            const Text('設計理念', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 18)),
            const SizedBox(height: 12),
            Container(
              height: 180,
              decoration: const NeoBoxDecoration(color: AppTheme.surface),
              child: TextField(
                controller: _conceptController,
                maxLines: null,
                style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  hintText: '詳細描述您的創作背景與設計理念...',
                  hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 48),

            NeoButton(
              onTap: () {
                final projectName = _nameController.text.trim().isEmpty ? '未命名專案' : _nameController.text.trim();
                final concept = _conceptController.text.trim().isEmpty ? '沒有提供設計理念' : _conceptController.text.trim();
                
                final projectData = {
                  'projectName': projectName,
                  'concept': concept,
                  'tags': [...selectedFields, ...selectedStyles],
                };
                
                Navigator.pop(context, projectData);
              },
              color: AppTheme.accentYellow,
              depth: 6.0,
              child: Container(
                height: 64,
                alignment: Alignment.center,
                child: const Text('儲存專案', style: TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 24, color: AppTheme.primary)),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Text('保存', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 16, fontWeight: FontWeight.w900, decoration: TextDecoration.underline, decorationThickness: 2)),
                ),
                const SizedBox(width: 32),
                GestureDetector(
                  onTap: () {},
                  child: const Text('預覽', style: TextStyle(fontFamily: 'Space Grotesk', fontSize: 16, fontWeight: FontWeight.w900, decoration: TextDecoration.underline, decorationThickness: 2)),
                ),
              ],
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

class DashedRectPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DashedRectPainter({this.color = AppTheme.primary, this.strokeWidth = 3, this.gap = 12});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    Path dashPath = Path();
    double dashWidth = gap;
    double dashSpace = gap;

    for (PathMetric pathMetric in path.computeMetrics()) {
      double distance = 0.0;
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth + dashSpace;
      }
    }
    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
