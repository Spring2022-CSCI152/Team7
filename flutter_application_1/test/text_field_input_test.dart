import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/Custom_Raised_Button.dart';

import 'package:flutter_application_1/widgets/text_field_input.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
 testWidgets("Text Input Test", (WidgetTester tester) async{
   var hintText = "Enter your email";
   var textInputType = TextInputType.text;
   
   await tester.pumpWidget(TextFieldInput(textEditingController: TextEditingController(), hintText: hintText, textInputType: textInputType));
 });
} //failed test case
