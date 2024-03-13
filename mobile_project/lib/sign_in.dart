import 'package:flutter/material.dart';
import 'package:mobile_project/hospitals_page.dart';
import 'package:mobile_project/sign_up.dart';
import 'testPage.dart';
import 'profile_page.dart';
import 'profile.dart';

Profile profile = Profile("John", "Doe", "John@gmail.com", "password", "cats",
    "Whitby ON", "L1M 0G2", "289-555-6666");

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _email = '';
  String? _password = '';
  String? _secretWord = "";
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 150, left: 25),
          child: Text("Sign In", style: TextStyle(fontSize: 25)),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Container(
                  width: 370,
                  height: 210,
                  child: Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.only(top: 5, left: 20, right: 20),
                              child: TextFormField(
                                decoration: InputDecoration(labelText: "Email"),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field cant be null';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _email = value;
                                },
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 5, left: 20, right: 20),
                              child: TextFormField(
                                obscureText: true,
                                decoration:
                                    InputDecoration(labelText: "Password"),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'This field cant be null';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _password = value;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                                padding: EdgeInsets.only(left: 40, right: 40),
                                width: 350,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.pinkAccent)),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content:
                                              Text("Logged In successfully"),
                                        ));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfilePage(
                                                        profile: profile)));
                                      }
                                    },
                                    child: Text("Sign In"))),
                          ])),
                ),
              ),
              //NOTE: THIS BUTTON IS ONLY FOR TESTING!
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) =>
              //                   ProfilePage(profile: profile)));
              //     },
              //     child: const Text("Skip Log in")),
              Container(
                  margin: EdgeInsets.only(top: 195),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink),
                      )))
            ],
          ),
        )
      ],
    ));
  }
}
