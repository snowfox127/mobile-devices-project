import 'package:flutter/material.dart';
import 'package:mobile_project/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:mobile_project/hospitals_page.dart';
import 'package:mobile_project/sign_up.dart';
import 'testPage.dart';
import 'profile_page.dart';
import 'profile.dart';

Profile profile = Profile("John", "Doe", "John@gmail.com", "password", "cats",
    "Whitby ON", "L1M 0G2", "289-555-6666");

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
            margin: EdgeInsets.only(top: 35, left: 25),
            child: Text("Sign Up", style: TextStyle(fontSize: 25)),
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
                    height: 175,
                    child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: 5, left: 20, right: 20),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "Email",
                                      labelStyle:
                                          TextStyle(color: Colors.pink)),
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
                                padding: EdgeInsets.only(
                                    top: 15, left: 20, right: 20),
                                child: TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      labelText: "Password",
                                      labelStyle: TextStyle(
                                        color: Colors.pink,
                                      )),
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
                            ])),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 100, left: 40, right: 40),
                    width: 350,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.pinkAccent)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Logged In successfully"),
                            ));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ProfilePage(profile: profile)));
                          }
                        },
                        child: Text("Continue"))),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Have an Account? ",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                            Text("Sign In",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pinkAccent))
                          ],
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }
}
