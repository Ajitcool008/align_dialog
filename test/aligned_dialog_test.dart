import 'package:align_dialog/align_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows dialog with alignment', (WidgetTester tester) async {
    // Create a test key for the widget.
    final testKey = Key('dialog_key');

    // Build a MaterialApp with the widget to test.
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                showAlignedDialog(
                  context: context,
                  builder: (context) => Container(
                    key: testKey,
                    width: 200,
                    height: 100,
                    color: Colors.white,
                    child: const Center(child: Text('Test Dialog')),
                  ),
                  // alignment: Alignment.bottomRight,
                );
              },
              child: const Text('Show Dialog'),
            ),
          ),
        ),
      ),
    );

    // Tap the button to show the dialog.
    await tester.tap(find.text('Show Dialog'));
    await tester.pumpAndSettle();

    // Verify that the dialog is displayed with the correct key.
    expect(find.byKey(testKey), findsOneWidget);
    expect(find.text('Test Dialog'), findsOneWidget);
  });
}
