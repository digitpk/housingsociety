import 'package:flutter/material.dart';
import 'package:housingsociety/screens/wrapper.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 300.0,
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() {
                        _email = val;
                      });
                    },
                    validator: (val) {
                      return val.isEmpty ? 'Enter an email' : null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Email ID',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        _password = val;
                      });
                    },
                    validator: (val) {
                      return val.length < 4
                          ? 'Password must be minimum of 4 characters'
                          : null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          print(_email + ' ' + _password);
                        }
                      },
                      child: Text('Continue'),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
