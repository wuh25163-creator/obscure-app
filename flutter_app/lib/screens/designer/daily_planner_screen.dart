import 'package:flutter/material.dart';
import '../../core/app_icons.dart';
import 'package:flutter/services.dart';
import '../../core/app_theme.dart';
import '../../core/neo_button.dart';

class DailyPlannerScreen extends StatefulWidget {
  const DailyPlannerScreen({super.key});

  @override
  State<DailyPlannerScreen> createState() => _DailyPlannerScreenState();
}

class _DailyPlannerScreenState extends State<DailyPlannerScreen> {
  late List<List<TextEditingController>> _taskControllersByCategory;
  late List<List<bool>> _checkedStatesByCategory;
  late List<List<FocusNode>> _taskFocusNodesByCategory;
  late List<int> _categoryDisplayOrder;

  final List<String> _headers = [
    '今日急件!',
    '這禮拜',
    '這個月',
    '今年',
    '個人目標'
  ];

  @override
  void initState() {
    super.initState();
    _categoryDisplayOrder = [0, 1, 2, 3, 4];
    
    // 初始化任務
    _taskControllersByCategory = [
      [TextEditingController(text: '緊急！修復 OBSCURE 網站溢出 BUG'), TextEditingController(text: '')],
      [TextEditingController(text: '完成設計系統初稿'), TextEditingController(text: '客戶初步需求討論'), TextEditingController(text: '')],
      [TextEditingController(text: '三月份內容策展計畫'), TextEditingController(text: '核心組件標準化'), TextEditingController(text: '')],
      [TextEditingController(text: '達成 10K 使用者訂閱'), TextEditingController(text: '年度作品集大改版'), TextEditingController(text: '')],
      [TextEditingController(text: '每日練習速寫 15 分鐘'), TextEditingController(text: '閱讀 2 本設計相關書籍'), TextEditingController(text: '')],
    ];
    _checkedStatesByCategory = [
      [false, false],
      [false, false, false],
      [false, false, false],
      [false, false, false],
      [false, false, false],
    ];
    
    // 初始化 FocusNodes 並綁定 Backspace 監聽
    _taskFocusNodesByCategory = List.generate(
      _headers.length,
      (catIdx) => List.generate(
        _taskControllersByCategory[catIdx].length, 
        (taskIdx) => _createFocusNode(catIdx, taskIdx)
      ),
    );
  }

  FocusNode _createFocusNode(int categoryIndex, int taskIndex) {
    final node = FocusNode();
    node.onKeyEvent = (node, event) {
      if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.backspace) {
        // 取得正確的現在索引，因為列表順序可能會變
        // 在目前的結構中，我們通過 categoryIndex 與 taskIndex 綁定，但刪除時需同步
        final controller = _taskControllersByCategory[categoryIndex][taskIndex];
        if (controller.selection.baseOffset == 0) {
          _removeTaskRow(categoryIndex: categoryIndex, taskIndex: taskIndex);
          return KeyEventResult.handled;
        }
      }
      return KeyEventResult.ignored;
    };
    return node;
  }

  @override
  void dispose() {
    for (final categoryControllers in _taskControllersByCategory) {
      for (final controller in categoryControllers) {
        controller.dispose();
      }
    }
    for (final categoryFocusNodes in _taskFocusNodesByCategory) {
      for (final node in categoryFocusNodes) {
        node.dispose();
      }
    }
    super.dispose();
  }

  void _updateCategoryOrdering() {
    setState(() {
      final active = <int>[];
      final empty = <int>[];

      for (int i = 0; i < _headers.length; i++) {
        bool hasText = _taskControllersByCategory[i].any((c) => c.text.trim().isNotEmpty);
        if (hasText) {
          active.add(i);
        } else {
          empty.add(i);
        }
      }
      _categoryDisplayOrder = [...active, ...empty];
    });
  }

  @override
  Widget build(BuildContext context) {
    // 角色守衛：設計師專屬頁面，非設計師立即導向客戶主頁
    if (!AppTheme.isDesigner) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, '/discovery_feed');
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final now = DateTime.now();
    final months = ['JANUARY', 'FEBRUARY', 'MARCH', 'APRIL', 'MAY', 'JUNE', 'JULY', 'AUGUST', 'SEPTEMBER', 'OCTOBER', 'NOVEMBER', 'DECEMBER'];
    final monthStr = '${now.year} ${months[now.month - 1]}';
    final weekdays = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
    final weekdayStr = weekdays[now.weekday - 1];

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: const ObscureAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${now.month}/${now.day} $weekdayStr',
                style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w900, fontSize: 80, height: 1.0, letterSpacing: -4),
              ),
              const SizedBox(height: 8),
              Text(
                monthStr,
                style: const TextStyle(fontFamily: 'Space Grotesk', fontWeight: FontWeight.w800, fontSize: 24, letterSpacing: 2),
              ),
              const SizedBox(height: 32),
              GestureDetector(
                onTap: () => setState(() => _isFocusMode = !_isFocusMode),
                child: Container(
                  width: double.infinity,
                  decoration: NeoBoxDecoration(
                    color: _isFocusMode ? AppTheme.primary : AppTheme.surface,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Text(
                    _isFocusMode ? '專注模式：已開啟 (FOCUS ON)' : '專注模式：已關閉 (FOCUS OFF)',
                    style: TextStyle(
                      color: _isFocusMode ? Colors.white : AppTheme.primary,
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Divider(color: AppTheme.primary, thickness: 4),
              const SizedBox(height: 32),

              ..._categoryDisplayOrder.map((catIndex) {
                final isLast = catIndex == _categoryDisplayOrder.last;
                return Column(
                  children: [
                    _buildCategorizedSection(catIndex),
                    if (!isLast) const SizedBox(height: 16),
                  ],
                );
              }),

              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 4),
          child: Container(
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: AppTheme.primary, width: 3),
              boxShadow: const [BoxShadow(color: AppTheme.primary, offset: Offset(4, 4))],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(context, 'home', AppTheme.isDesigner ? '/daily_planner' : '/discovery_feed', isActive: true),
                _buildNavItem(context, 'search', '/search_categories'),
                _buildNavItem(context, 'shining', '/commission_status'),
                _buildNavItem(context, 'chat', '/message_inbox'),
                _buildNavItem(context, 'user', '/designer_profile'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isFocusMode = true;

  Widget _buildCategorizedSection(int index) {
    switch (index) {
      case 0:
        return _buildCategoryItem(0, headerColor: Colors.white, boxColor: AppTheme.accentRed, textColor: Colors.white);
      case 1:
        return _buildCategoryItem(1, boxColor: AppTheme.accentYellow);
      case 2:
        return _buildCategoryItem(2, boxColor: AppTheme.accentBlue, headerColor: Colors.white, textColor: Colors.white);
      case 3:
        return _buildCategoryItem(3, boxColor: AppTheme.surface);
      case 4:
        return _buildCategoryItem(4, boxColor: AppTheme.primary, headerColor: Colors.white, textColor: Colors.white);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildCategoryItem(int index, {Color? headerColor, Color? boxColor, Color? textColor}) {
    return Container(
      decoration: NeoBoxDecoration(color: boxColor ?? AppTheme.surface),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _headers[index],
            style: TextStyle(
              fontFamily: 'Space Grotesk',
              fontWeight: FontWeight.w900,
              fontSize: 24,
              color: headerColor ?? AppTheme.primary,
              letterSpacing: 0,
            ),
          ),
          const SizedBox(height: 12),
          Column(
            children: List.generate(_taskControllersByCategory[index].length, (taskIndex) {
              final isChecked = _checkedStatesByCategory[index][taskIndex];
              final isLastItem = taskIndex == _taskControllersByCategory[index].length - 1;
              final displayTextColor = textColor ?? AppTheme.primary;

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (!isLastItem)
                      NeoButton(
                        onTap: () {
                          _toggleChecked(index, taskIndex);
                        },
                        color: isChecked ? AppTheme.accentYellow : Colors.white,
                        depth: 2.0,
                        borderWidth: 2.5,
                        child: Container(
                          width: 24,
                          height: 24,
                          alignment: Alignment.center,
                          child: isChecked
                              ? const Icon(Icons.check, size: 16, color: AppTheme.primary)
                              : null,
                        ),
                      )
                    else
                      const SizedBox(width: 32),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        focusNode: _taskFocusNodesByCategory[index][taskIndex],
                        controller: _taskControllersByCategory[index][taskIndex],
                        minLines: 1,
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                          fontFamily: 'Space Grotesk',
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: isChecked ? displayTextColor.withValues(alpha: 0.5) : displayTextColor,
                          decoration: isChecked ? TextDecoration.lineThrough : null,
                          letterSpacing: 0,
                        ),
                        decoration: InputDecoration(
                          hintText: isLastItem ? '新增項目...' : null,
                          hintStyle: TextStyle(color: displayTextColor.withValues(alpha: 0.4)),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                        onChanged: (_) => _updateCategoryOrdering(),
                        onSubmitted: (_) => _addTaskRow(categoryIndex: index),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  void _toggleChecked(int categoryIndex, int taskIndex) {
    setState(() {
      final isChecked = !(_checkedStatesByCategory[categoryIndex][taskIndex]);
      _checkedStatesByCategory[categoryIndex][taskIndex] = isChecked;

      if (isChecked) {
        final controller = _taskControllersByCategory[categoryIndex].removeAt(taskIndex);
        final checked = _checkedStatesByCategory[categoryIndex].removeAt(taskIndex);
        final focus = _taskFocusNodesByCategory[categoryIndex].removeAt(taskIndex);

        final lastBlankIndex = _taskControllersByCategory[categoryIndex].indexWhere((c) => c.text.isEmpty);
        final insertIndex = lastBlankIndex != -1 ? lastBlankIndex : _taskControllersByCategory[categoryIndex].length;

        _taskControllersByCategory[categoryIndex].insert(insertIndex, controller);
        _checkedStatesByCategory[categoryIndex].insert(insertIndex, checked);
        _taskFocusNodesByCategory[categoryIndex].insert(insertIndex, focus);
      }
    });

    _updateCategoryOrdering();
  }

  void _addTaskRow({required int categoryIndex}) {
    setState(() {
      _taskControllersByCategory[categoryIndex].add(TextEditingController(text: ''));
      _checkedStatesByCategory[categoryIndex].add(false);
      _taskFocusNodesByCategory[categoryIndex].add(_createFocusNode(categoryIndex, _taskControllersByCategory[categoryIndex].length - 1));
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final newIndex = _taskControllersByCategory[categoryIndex].length - 1;
      if (newIndex >= 0 && newIndex < _taskFocusNodesByCategory[categoryIndex].length) {
        _taskFocusNodesByCategory[categoryIndex][newIndex].requestFocus();
      }
    });

    _updateCategoryOrdering();
  }

  void _removeTaskRow({required int categoryIndex, required int taskIndex}) {
    final removedController = _taskControllersByCategory[categoryIndex][taskIndex];
    final removedFocusNode = _taskFocusNodesByCategory[categoryIndex][taskIndex];

    setState(() {
      if (_taskControllersByCategory[categoryIndex].length <= 1) {
        _taskControllersByCategory[categoryIndex][0].clear();
        _checkedStatesByCategory[categoryIndex][0] = false;
      } else {
        _taskControllersByCategory[categoryIndex].removeAt(taskIndex);
        _checkedStatesByCategory[categoryIndex].removeAt(taskIndex);
        _taskFocusNodesByCategory[categoryIndex].removeAt(taskIndex);
        
        removedController.dispose();
        removedFocusNode.dispose();
        
        // 重新同步剩餘的 FocusNodes 索引（非常重要，因為閉包中存的是 taskIndex）
        for (int i = 0; i < _taskFocusNodesByCategory[categoryIndex].length; i++) {
          final newNode = _createFocusNode(categoryIndex, i);
          _taskFocusNodesByCategory[categoryIndex][i] = newNode;
          // 無法輕易地把舊項目的狀態轉給新 Node，但既然我們在 rebuild，這是最安全的方式。
        }
      }
    });

    _updateCategoryOrdering();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final len = _taskControllersByCategory[categoryIndex].length;
      if (len == 0) return;
      final newIndex = (taskIndex - 1).clamp(0, len - 1);
      if (newIndex < _taskFocusNodesByCategory[categoryIndex].length) {
        _taskFocusNodesByCategory[categoryIndex][newIndex].requestFocus();
      }
    });
  }

  Widget _buildNavItem(BuildContext context, String iconName, String route, {bool isActive = false}) {
    return GestureDetector(
      onTap: () {
        if (!isActive) Navigator.pushReplacementNamed(context, route);
      },
      child: Container(
        width: isActive ? 48 : 40,
        height: isActive ? 48 : 40,
        decoration: BoxDecoration(
          color: isActive ? AppTheme.accentYellow : Colors.white,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: AppIcons.fromName(iconName, color: AppTheme.primary, size: 28, isActive: isActive),
      ),
    );
  }
}
