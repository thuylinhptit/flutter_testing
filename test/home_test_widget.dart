import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_test/home.dart';
import 'package:project_test/main.dart';

void main (){
  testWidgets("Flutter Widget Test",  (WidgetTester tester) async {
    await tester.pumpWidget(Home());
    var textField = find.byType(TextField);
    expect(textField, findsWidgets);
    await tester.enterText(textField, 'enterText');
    expect(find.text('enterText'), findsWidgets);
    var button = find.text("Login");
    expect(button,findsOneWidget);
    await tester.tap(button);
    await tester.pump();
    expect(find.text("Login"),findsOneWidget);
  });
}