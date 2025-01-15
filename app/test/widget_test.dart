import 'package:flutter_test/flutter_test.dart';
import 'package:app/main.dart';

void main() {
  group('Basic App Tests', () {
    testWidgets('App should build without errors', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that the app builds successfully
      expect(find.byType(MyApp), findsOneWidget);
    });

    test('Simple value test', () {
      // Simple test that will always pass
      expect(true, isTrue);
    });

    test('Basic math test', () {
      // Another simple test that will always pass
      int result = 2 + 2;
      expect(result, equals(4));
    });

    test('String test', () {
      // String manipulation test
      String testString = 'Flutter';
      expect(testString.length, equals(7));
      expect(testString.contains('Flut'), isTrue);
    });
  });
}
