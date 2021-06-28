import 'package:medicationinfosys/auth.dart';
import 'package:medicationinfosys/constants.dart';
import 'package:medicationinfosys/loading.dart';
import 'package:flutter/material.dart';
import 'package:medicationinfosys/register.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: kPrimaryColor,
            appBar: AppBar(
              elevation: 0,
              brightness: Brightness.light,
              backgroundColor: kPrimaryColor,
            ),
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: double.infinity,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 40),
                                    height: 120,
                                    width: 120,
                                    child: Image.asset(
                                      'assets/images/pill.png',
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Text(
                                    "Medinfo",
                                    style: TextStyle(
                                        fontSize: 46,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  ),
                                  Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[100],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 15.0),
                                  TextFormField(
                                      decoration: textInputDecoration.copyWith(
                                          hintText: 'Email'),
                                      validator: (val) =>
                                          val.isEmpty ? 'Enter an email' : null,
                                      onChanged: (val) {
                                        setState(() => email = val);
                                      }),
                                  SizedBox(height: 15.0),
                                  TextFormField(
                                      decoration: textInputDecoration.copyWith(
                                          hintText: 'Password'),
                                      obscureText: true,
                                      validator: (val) => val.length < 6
                                          ? 'Enter a password 6+ chars long'
                                          : null,
                                      onChanged: (val) {
                                        setState(() => password = val);
                                      }),
                                  SizedBox(height: 15.0),
                                  RaisedButton(
                                      color: Colors.amber,
                                      child: Text(
                                        'Sign in',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() => loading = true);
                                          dynamic result = await _auth
                                              .signInWithEmailAndPassword(
                                                  email, password);
                                          if (result == null) {
                                            setState(() {
                                              error =
                                                  'could not sign in with those credentials';
                                              loading = false;
                                            });
                                          }
                                        }
                                      }),
                                  SizedBox(height: 12.0),
                                  Text(
                                    error,
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 14.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                              child: Row(
                            children: <Widget>[
                              Text(
                                'Does not have an account ?',
                                style: TextStyle(color: Colors.white),
                              ),
                              FlatButton(
                                textColor: Colors.amber,
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                onPressed: () {
                                  //signin screen
                                  widget.toggleView();
                                },
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ))
                        ],
                      ),
                    ]),
              ),
            ),
          );
  }
}
