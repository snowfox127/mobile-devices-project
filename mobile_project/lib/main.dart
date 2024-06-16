import 'package:flutter/material.dart';
import 'package:mobile_project/profile.dart';
import 'package:mobile_project/reset_password.dart';
import 'package:mobile_project/sign_in.dart';
import 'package:mobile_project/profile_page.dart';
import 'package:mobile_project/about_page.dart';
import 'package:mobile_project/location_page.dart';
import 'package:firebase_core/firebase_core.dart';

Profile testProfile = Profile("John", "Doe", "John@gmail.com", "password",
    "cats", "Whitby ON", "L1M 0G2", "289-555-6666");
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Group Healthcare App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Homepage is placeholder
  List<Widget> pages = [
    ProfilePage(profile: testProfile),
    MyHomePage(),
    MyHomePage(),
    ResetPassword(),
    AboutPage(),
    LocationPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignIn(),
    );
  }
}
