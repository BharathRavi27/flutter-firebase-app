import 'package:brew_score/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email = '';
  String password = '';
  String error = '';

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text('Sign in to Brew Crew'),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Register'),
              onPressed: () {
                widget.toggleView();
              },
            )
          ],
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                      validator: (val) =>
                          val.isEmpty ? 'Enter an E-mail' : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      }),
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    validator: (val) =>
                        val.length < 6 ? 'Enter atleast 6 charectors' : null,
                    onChanged: (val) {
                      setState(() {
                        password = val;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {},
                  )
                ],
              ),
            )));
  }
}
