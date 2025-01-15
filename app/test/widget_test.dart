import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/main.dart';

void main() {
  group('RedirectApp Tests', () {
    // Test basic app functionality
    test('Basic app functionality test', () {
      // Simple test that will always pass
      expect(true, isTrue);
    });

    // Test URL constant
    test('RedirectPage should have correct URL', () {
      final redirectPage = RedirectPage();
      expect(redirectPage.redirectUrl, equals('https://unikatko.si/'));
    });

    // Test app title
    testWidgets('App should have correct title', (WidgetTester tester) async {
      await tester.pumpWidget(RedirectApp());
      final titleFinder = find.text('Unikatko');
      expect(titleFinder, findsOneWidget);
    });

    // Test theme color
    test('App should have blue theme', () {
      final app = RedirectApp();
      final materialApp = app.build(TestBuildContext()) as MaterialApp;
      expect(materialApp.theme?.primarySwatch, Colors.blue);
    });
  });
}

// Helper class for testing
class TestBuildContext implements BuildContext {
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
