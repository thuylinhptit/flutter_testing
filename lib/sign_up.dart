import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUp createState() => _SignUp();
}

bool check = false;

class _SignUp extends State<SignUp> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  String _password2 = '';
  final passController = TextEditingController();
  final retypePassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  controller: passController,
                  validator: (v) => FormValidator.validatePassword(v!),
                  onSaved: (value) {
                    _password = value!.trim();
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Re-enter Password"),
                  obscureText: true,
                  controller: retypePassController,
                  validator: (v) => FormValidator.validatePassword(v!),
                  onSaved: (value) {
                    _password2 = value!.trim();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  onPressed: signUp,
                  child: const Text('Sign Up'),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            )),
      ),
    );
  }

  signUp() async {
    if (retypePassController.text == passController.text) {
      setState(() {
        check = true;
      });
    } else {
      setState(() {
        check = false;
      });
    }
    final FormState? form = _formkey.currentState;
    if (!form!.validate()) {
      print("Please enter valid details!!");
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
    if (check == false) return 'Password incorrect';
    return null;
  }
}
