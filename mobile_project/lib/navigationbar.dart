import 'package:flutter/material.dart';
import 'profile.dart';
import 'package:mobile_project/profile.dart';
import 'package:mobile_project/reset_password.dart';
import 'package:mobile_project/profile_page.dart';
import 'package:mobile_project/about_page.dart';
import 'package:mobile_project/location_page.dart';
import 'package:mobile_project/hospitals_page.dart';

Profile testProfile = Profile("John", "Doe", "John@gmail.com", "password",
    "cats", "Whitby ON", "L1M 0G2", "289-555-6666");

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          if (selectedIndex == 0) {
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(profile: testProfile)));
          } else if (selectedIndex == 1) {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LocationPage()));
          } else if (selectedIndex == 2) {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HospitalsPage()));
          } else if (selectedIndex == 3) {
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResetPassword()));
          } else if (selectedIndex == 4) {
            Navigator.pop(context);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AboutPage()));
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.pink),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on, color: Colors.pink),
              label: 'Location'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.pink,
              ),
              label: 'Hospitals'),
          BottomNavigationBarItem(
              icon: Icon(Icons.password, color: Colors.pink),
              label: 'Change Password'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer, color: Colors.pink),
              label: 'About')
        ]);
  }
}
