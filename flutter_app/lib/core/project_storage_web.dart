// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use

import 'dart:convert';
import 'dart:html' as html;

import 'app_theme.dart';

class ProjectStorage {
  static const _storageKey = 'obscure.designerProjects.v1';
  static const _roleKey = 'obscure.role.v1';
  static const _designerNicknameKey = 'obscure.designerNickname.v1';

  static Future<List<DesignerSavedProject>> loadDesignerProjects() async {
    final raw = html.window.localStorage[_storageKey];
    if (raw == null || raw.isEmpty) {
      return const [];
    }

    final decoded = jsonDecode(raw);
    if (decoded is! List) {
      return const [];
    }

    return decoded
        .whereType<Map<String, dynamic>>()
        .map(DesignerSavedProject.fromJson)
        .toList();
  }

  static Future<void> saveDesignerProjects(
    List<DesignerSavedProject> projects,
  ) async {
    final encoded = jsonEncode(
      projects.map((project) => project.toJson()).toList(),
    );
    html.window.localStorage[_storageKey] = encoded;
  }

  static Future<Map<String, String>> loadRoleState() async {
    final state = <String, String>{};
    final role = html.window.localStorage[_roleKey];
    final nickname = html.window.localStorage[_designerNicknameKey];
    if (role != null) {
      state['role'] = role;
    }
    if (nickname != null) {
      state['designerNickname'] = nickname;
    }
    return state;
  }

  static Future<void> saveRoleState({
    required bool isDesigner,
    required String designerNickname,
  }) async {
    html.window.localStorage[_roleKey] = isDesigner ? 'designer' : 'customer';
    html.window.localStorage[_designerNicknameKey] = designerNickname;
  }
}
