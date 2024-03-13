import 'package:flutter/material.dart';
import 'package:mobile_project/app_drawer.dart';
import 'package:mobile_project/navigationbar.dart';
import 'profile.dart';

Profile testProfile = Profile("John", "Doe", "John@gmail.com", "password",
    "cats", "Whitby ON", "L1M 0G2", "289-555-6666");

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const AppDrawer(),
        body: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.pink,
                width: 1,
              ),
            ),
            child: InkWell(
              splashColor: Colors.pink.withAlpha(30),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    'This app, created by Ontario Tech U students, is designed to helps users like you find nearby hospitals quickly and efficiently. Either enter your location or look up nearby clinics to get started!  '),
              ),
            ),
          ),
        ),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            foregroundColor: Colors.pinkAccent,
            toolbarHeight: 90,
            title: const Text("About Page",
                style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold))),
        //body:
        bottomNavigationBar: const NavBar());
  }
}
