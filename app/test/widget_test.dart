import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Basic App Tests', () {
    // Basic test that will always pass
    test('True should be true', () {
      expect(true, isTrue);
    });

    // String test
    test('String test', () {
      String testString = 'Unikatko';
      expect(testString.length, equals(8));
      expect(testString.contains('Uni'), isTrue);
    });

    // Simple math test
    test('Math operations work', () {
      expect(2 + 2, equals(4));
      expect(10 - 5, equals(5));
    });

    // List test
    test('List operations work', () {
      var list = ['Flutter', 'Test'];
      expect(list.length, equals(2));
      expect(list.contains('Flutter'), isTrue);
    });
  });

  group('Widget Tests', () {
    testWidgets('MaterialApp can be created', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Test App'),
            ),
          ),
        ),
      );

      expect(find.text('Test App'), findsOneWidget);
    });
  });
}
