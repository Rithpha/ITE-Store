import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_api/app/app.dart';

void main() {
  testWidgets('App should build without error', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.byType(App), findsOneWidget);
  });
}
