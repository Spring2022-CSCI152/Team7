import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/Custom_Raised_Button.dart';
import 'package:flutter_application_1/widgets/text_field_input.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Custom Button Widget Test', (WidgetTester tester) async {
    // ignore: prefer_typing_uninitialized_variables
    Widget child;
    String text = "Marcos";
    await tester.pumpWidget(
      MaterialApp(
          home: CustomRaisedButton(
        borderRadius: 50,
        color: Colors.blue,
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(color: Colors.amber, fontSize: 15.0),
        ),
      )),
    );
    final button = find.byType(ElevatedButton);
    expect(button,findsNothing);
  });
}
