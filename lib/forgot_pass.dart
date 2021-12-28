import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_test/home.dart';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPass createState() => _ForgotPass();
}

class _ForgotPass extends State<ForgotPass> {
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
                      child: Text('Forgot Password'),
                    ),
                  ),
                  const Text("Enter new password"),
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
                    child: const Text('Save Password'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  login() async {
    final FormState? form = _formkey.currentState;
    if (!form!.validate()) {
      print("Please enter valid details!");
    } else {
      form.save();
    }
  }


}
