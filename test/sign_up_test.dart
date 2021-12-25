import 'package:flutter_test/flutter_test.dart';
import 'package:project_test/sign_up.dart';

void main() {
  group('SignUp', () {
    test('Empty Email Test', () {
      var result = FormValidator.validateEmail('');
      expect(result, 'Please enter an email!');
    });

    test('Invalid Email Test', () {
      var result = FormValidator.validateEmail('asdfasdfasdf');
      expect(result, 'Please enter a valid email');
    });

    test('Valid Email Test', () {
      var result = FormValidator.validateEmail('ninhnt.ptit@gmail.com');
      expect(result, null);
    });
    test('Empty Password Test', () {
      var result = FormValidator.validatePassword('');
      expect(result, 'Please choose a password.');
    });

    test('Invalid Password Test', () {
      var result = FormValidator.validatePassword('123');
      expect(result, 'Password must contain atleast 8 characters.');
    });

    test('Valid Password Test', () {
      var result = FormValidator.validatePassword('ninh12345');
      expect(result, null);
    });
  });
}
