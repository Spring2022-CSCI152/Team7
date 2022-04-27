import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/follow_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('description', (WidgetTester tester) async {
    await tester.pumpWidget( FollowButton(backgroundColor: Colors.white, borderColor: Colors.red, text: "Marcos", textColor: Colors.white));
  });
}
