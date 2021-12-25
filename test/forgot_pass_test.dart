import 'package:project_test/home.dart';
import 'package:test/test.dart';

void main() {
  group('Home', () {
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
