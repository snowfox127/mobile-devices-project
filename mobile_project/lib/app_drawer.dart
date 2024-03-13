import 'package:flutter/material.dart';
import 'package:mobile_project/profile_page.dart';
import 'package:mobile_project/location_page.dart';
import 'package:mobile_project/hospitals_page.dart';
import 'profile.dart';

Profile testProfile = Profile("John", "Doe", "John@gmail.com", "password",
    "cats", "Whitby ON", "L1M 0G2", "289-555-6666");

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      Icon(Icons.image_outlined, size: 100, color: Colors.pink),
      Container(
          padding: EdgeInsets.only(top: 40.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HospitalsPage()));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.home),
                    Text("Hospitals"),
                    Icon(Icons.arrow_forward_ios)
                  ]))),
      Container(
          padding: EdgeInsets.only(top: 10.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LocationPage()));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.location_on),
                    Text("Locations"),
                    Icon(Icons.arrow_forward_ios)
                  ]))),
      Container(
          padding: EdgeInsets.only(top: 10.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProfilePage(profile: testProfile)));
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.person),
                    Text("Profile"),
                    Icon(Icons.arrow_forward_ios)
                  ]))),
      Container(
          padding: EdgeInsets.only(top: 10.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Icon(Icons.logout),
                    Text("Log Out"),
                    Icon(Icons.arrow_forward_ios)
                  ]))),
    ]));
  }
}
