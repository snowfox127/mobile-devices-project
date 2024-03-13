import 'package:flutter/material.dart';
import 'package:mobile_project/navigationbar.dart';
import 'package:mobile_project/sign_in.dart';
import 'profile.dart';

Profile testProfile = Profile("John", "Doe", "John@gmail.com", "password",
    "cats", "Whitby ON", "L1M 0G2", "289-555-6666");

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            foregroundColor: Colors.pinkAccent,
            toolbarHeight: 90,
            title: const Text("Reset Password",
                style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold))),
        body: make(context),
        bottomNavigationBar: const NavBar());
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _email = '';
  String? _password = '';
  String? _secretWord = "";
  bool passOne = false;
  bool passTwo = false;
  TextEditingController _controller = TextEditingController();
  TextEditingController _controllerTwo = TextEditingController();
  TextEditingController _controllerThree = TextEditingController();
  @override
  Widget make(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Container(
        margin: EdgeInsets.only(top: 150, left: 25),
        child: Text("Reset Password", style: TextStyle(fontSize: 25)),
      ),
      Container(
          padding: EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Card(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Container(
                width: 370,
                height: 234,
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Current password Form
                          Container(
                            padding:
                                EdgeInsets.only(top: 5, left: 20, right: 20),
                            child: TextFormField(
                              controller: _controller,
                              decoration: InputDecoration(
                                  labelText: "Current Password"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Wrong Password';
                                }

                                return null;
                              },
                            ),
                          ),
                          // Enter new password
                          Container(
                            padding:
                                EdgeInsets.only(top: 5, left: 20, right: 20),
                            child: TextFormField(
                              controller: _controllerTwo,
                              obscureText: true,
                              decoration:
                                  InputDecoration(labelText: "New Password"),
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
                          Container(
                            padding:
                                EdgeInsets.only(top: 5, left: 20, right: 20),
                            child: TextFormField(
                              controller: _controllerThree,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelText: "Confirm New Password"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Incorrect New Password';
                                }

                                return null;
                              },
                              onSaved: (value) {
                                _password = value;
                                if (value != null) profile.password = value;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ])),
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.pinkAccent)),
                    onPressed: () {
                      if (_controller == profile.password) {
                        passOne = true;
                      }
                      if (_controllerTwo == _controllerThree) {
                        passTwo = true;
                      }
                      setState(() {
                        if (true) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Password reset"),
                          ));
                          /*
              }else{
                
                  ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(
                    content:
                  Text("Incorrect Fields"),
                  )
                );
                */
                        }
                      });
                    },
                    child: Text("Reset")))
          ]))
    ]));
  }
}
