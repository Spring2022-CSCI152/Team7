import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/comment_card.dart';
import 'package:flutter_automation/flutter_automation.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('description', (WidgetTester tester) async {
    await tester.pumpWidget(CommentCard(snap: "profilePic"));
  });
}