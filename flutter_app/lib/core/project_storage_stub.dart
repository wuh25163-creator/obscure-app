import 'app_theme.dart';

class ProjectStorage {
  static Future<List<DesignerSavedProject>> loadDesignerProjects() async {
    return const [];
  }

  static Future<void> saveDesignerProjects(
    List<DesignerSavedProject> projects,
  ) async {}

  static Future<Map<String, String>> loadRoleState() async {
    return const {};
  }

  static Future<void> saveRoleState({
    required bool isDesigner,
    required String designerNickname,
  }) async {}
}
