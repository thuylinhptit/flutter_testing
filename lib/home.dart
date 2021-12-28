import 'package:flutter/material.dart';
import 'package:project_test/forgot_pass.dart';
import 'package:project_test/sign_up.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _email = ' ';
  String _password = ' ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formkey,
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Center(
                      child: Text('Login'),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: (v) => FormValidator.validateEmail(v!),
                    onSaved: (value) {
                      _email = value!.trim();
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Password"),
                    obscureText: true,
                    validator: (v) => FormValidator.validatePassword(v!),
                    onSaved: (value) {
                      _password = value!.trim();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    onPressed: login,
                    child: const Text('Login'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        child: const Text("Sign up"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => SignUp()));
                        },
                      ),
                      const Spacer(),
                      GestureDetector(
                        child: const Text("Forgot Password"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPass()));
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }

  login() async {
    final FormState? form = _formkey.currentState;
    if (!form!.validate()) {
      print("Please enter valid details");
    } else {
      form.save();
    }
  }
}

class FormValidator {
  static String? validateEmail(String email) {
    if (email.isEmpty) return "Please enter an email!";
    Pattern pattern =
        r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
    RegExp regExp = RegExp(pattern as String);
    if (!regExp.hasMatch(email)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) return 'Please choose a password.';
    if (value.length < 8) return 'Password must contain atleast 8 characters.';
    return null;
  }
}
