import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:advance_text_field/advance_text_field.dart';

void main() {
  testWidgets('AdvanceTextField displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AdvanceTextField(
            type: AdvanceTextFieldType.EDIT,
            editLabel: const Icon(Icons.edit),
            saveLabel: const Icon(Icons.check),
            textHint: 'Enter text',
          ),
        ),
      ),
    );

    expect(find.byType(AdvanceTextField), findsOneWidget);
    expect(find.byIcon(Icons.edit), findsOneWidget);
  });

  testWidgets('AdvanceTextField calls onSaveTap callback', (WidgetTester tester) async {
    String? savedText;
    
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AdvanceTextField(
            type: AdvanceTextFieldType.SAVE,
            editLabel: const Icon(Icons.edit),
            saveLabel: const Icon(Icons.check),
            textHint: 'Enter text',
            onSaveTap: (text) {
              savedText = text;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.byIcon(Icons.check));
    await tester.pump();

    // The callback should be called when save is tapped
    expect(savedText, isNotNull);
  });
}
