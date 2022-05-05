import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/follow_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('description', (WidgetTester tester) async {
    String text = "Team 7";
    await tester.pumpWidget(
      MaterialApp( 
        home: FollowButton(
        backgroundColor: Colors.white,
        borderColor: Colors.red,
        text: text,
        textColor: Colors.white)),
    );
  final button = find.byType(FollowButton);
  expect(button, findsNothing);
  });
}
