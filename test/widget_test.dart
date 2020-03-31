import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_game/main.dart';

void main() {
  testWidgets('Title Screen Exists Smoke Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(FlutterGame());
  });
}
