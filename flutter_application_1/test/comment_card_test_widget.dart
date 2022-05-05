import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/comment_card.dart';
import 'package:flutter_automation/flutter_automation.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Comment Card', (WidgetTester tester) async {
    String text = "Marcos";
    await tester.pumpWidget(
      MaterialApp(
        home: CommentCard(
          snap: text
          )
      ),
    );
      expect(find.text("Marcos"), CommentCard);
  });
}