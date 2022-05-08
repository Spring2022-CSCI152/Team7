import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/like_animation.dart';
import 'package:flutter_application_1/widgets/text_field_input.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_application_1/main.dart' as app;

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("Full App Test", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      final emailFormField = find.byType(TextFieldInput).first;
      final passwordFormField = find.byType(TextFieldInput).last;
      final loginInButton = find.byType(InkWell).first;
      await tester.enterText(emailFormField, "Doggy@gmail.com");
      await tester.pumpAndSettle();
      await tester.enterText(passwordFormField, "123456");
      await tester.pumpAndSettle();
      await tester.tap(loginInButton);
      await tester.pumpAndSettle();
      final likePicture = find.byType(LikeAnimation).first;
      expect(tester.hasRunningAnimations, LikeAnimation);

// command
// flutter drive \
// --driver=test_driver/integration_test.dart \
// --target=integration_test/login_test.dart
    });
  });
}
