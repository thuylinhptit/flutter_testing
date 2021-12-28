import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_test/forgot_pass.dart';
import 'package:project_test/home.dart';
import 'package:project_test/main.dart';

void main (){
  testWidgets("Flutter Widget Test",  (WidgetTester tester) async {
    await tester.pumpWidget(ForgotPass());
    var textField = find.byType(TextField);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, 'enterText');
    expect(find.text('enterText'), findsOneWidget);
    var button = find.text("Save Password");
    expect(button,findsOneWidget);
    await tester.tap(button);
    await tester.pump();
    expect(find.text("Save Password"),findsOneWidget);
  });
}