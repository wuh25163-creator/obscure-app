import 'package:flutter_test/flutter_test.dart';

import 'package:obscure_app/main.dart';

void main() {
  testWidgets('App should start with login screen', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const StitchApp());

    expect(find.text('登入 LOGIN'), findsOneWidget);
    expect(find.text('手機號碼 MOBILE NUMBER'), findsOneWidget);
  });
}
