import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bmicalculator/main.dart';
import 'package:bmicalculator/widgets/calculate_button.dart';

void main() {
  group('End-to-End BMI App Test', () {
    setUp(() {
      SharedPreferences.setMockInitialValues({});
    });

    testWidgets('Calculate BMI and verify it appears in history', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: BmiCalculatorApp(),
        ),
      );

      // Wait for splash screen to finish (2 seconds)
      await tester.pumpAndSettle(const Duration(seconds: 3));

      // We should be on HomeScreen now. Find the CalculateButton
      final calculateBtnFinder = find.byType(CalculateButton);
      expect(calculateBtnFinder, findsOneWidget);

      // Tap calculate button
      await tester.tap(calculateBtnFinder);
      await tester.pumpAndSettle();

      // Verify result card has updated (it should show BMI)
      expect(find.text('Your BMI'), findsOneWidget);

      // Switch to History Tab (bottom navigation bar item at index 1)
      final historyTabFinder = find.byIcon(Icons.timer_outlined);
      expect(historyTabFinder, findsOneWidget);
      await tester.tap(historyTabFinder);
      await tester.pumpAndSettle();

      // Verify the history item is shown (we should not see "No BMI History")
      expect(find.text("No BMI History"), findsNothing);
      expect(find.text("Normal"), findsWidgets);
    });
  });
}
