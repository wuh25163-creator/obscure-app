import os

files = [
  'search_categories_screen.dart',
  'portfolio_management_screen.dart',
  'message_inbox_screen.dart',
  'discovery_feed_screen.dart',
  'designer_profile_screen.dart',
  'daily_planner_screen.dart',
  'commission_status_screen.dart'
]

dir_path = r'c:\Users\wuh32\Downloads\stitch_identity_selection\flutter_app\lib\screens'

for f in files:
    full = os.path.join(dir_path, f)
    with open(full, 'r', encoding='utf-8') as f_obj:
        content = f_obj.read()
    
    # 1. Replace the decoration and container wrapping
    content = content.replace(
'''      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: AppTheme.background,
          border: Border(top: BorderSide(color: AppTheme.primary, width: 4)),
        ),
        child: Row(''', 
'''      bottomNavigationBar: SafeArea(
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
            child: Row(''')

    # 2. Add extra bracket at the end of bottomNavigationBar to close Padding and SafeArea
    content = content.replace(
'''          ],
        ),
      ),
    );''',
'''          ],
            ),
          ),
        ),
      ),
    );''')
    
    # 3. Replace Icon configurations:
    content = content.replace('Icons.home, AppTheme.isDesigner', 'Icons.home_rounded, AppTheme.isDesigner')
    content = content.replace("Icons.search, '/search_categories'", "Icons.search_rounded, '/search_categories'")
    content = content.replace("Icons.auto_awesome, '/commission_status'", "Icons.auto_awesome_rounded, '/commission_status'")
    content = content.replace("Icons.mail, '/message_inbox'", "Icons.chat_bubble_outline_rounded, '/message_inbox'")
    content = content.replace("Icons.person, '/designer_profile'", "Icons.person_outline_rounded, '/designer_profile'")

    # 4. Replace _buildNavItem definition
    content = content.replace(
'''  Widget _buildNavItem(BuildContext context, IconData icon, String route, {bool isActive = false}) {
    return GestureDetector(
      onTap: () {
        if (!isActive) Navigator.pushReplacementNamed(context, route);
      },
      child: Container(
        width: isActive ? 64 : 48,
        height: isActive ? 64 : 48,
        decoration: isActive
            ? BoxDecoration(
                color: AppTheme.accentYellow,
                border: Border.all(color: AppTheme.primary, width: 2),
              )
            : null,
        alignment: Alignment.center,
        child: Icon(icon, color: isActive ? AppTheme.primary : AppTheme.primary.withOpacity(0.8), size: isActive ? 36 : 28),
      ),
    );
  }''',
'''  Widget _buildNavItem(BuildContext context, IconData icon, String route, {bool isActive = false}) {
    return GestureDetector(
      onTap: () {
        if (!isActive) Navigator.pushReplacementNamed(context, route);
      },
      child: Container(
        width: isActive ? 48 : 40,
        height: isActive ? 48 : 40,
        decoration: isActive
            ? BoxDecoration(
                color: AppTheme.accentYellow,
                shape: BoxShape.circle,
                border: Border.all(color: AppTheme.primary, width: 2),
              )
            : null,
        alignment: Alignment.center,
        child: Icon(icon, color: AppTheme.primary, size: isActive ? 28 : 28),
      ),
    );
  }''')
    
    with open(full, 'w', encoding='utf-8') as f_obj:
        f_obj.write(content)

print("Updated 7 files!")
