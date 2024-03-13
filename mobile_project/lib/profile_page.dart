import 'package:flutter/material.dart';
import 'package:mobile_project/app_drawer.dart';
import 'profile.dart';
import 'navigationbar.dart';

class ProfilePage extends StatelessWidget {
  Profile profile = Profile("John", "Doe", "John@gmail.com", "password", "cats",
      "Whitby ON", "L1M 0G2", "289-555-6666");
  ProfilePage({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                alignment: Alignment.centerRight,
                icon: Icon(Icons.edit))
          ],
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.pinkAccent,
          toolbarHeight: 90,
          title: const Text("Profile Page",
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.bold))),
      bottomNavigationBar: const NavBar(),
      body: makeProfilePage(),
    );
  }

  Widget makeProfilePage() {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: chooseDisplay(),
        ),
        Expanded(
          child: makeProfileList(),
        )
      ],
    );
  }

  Widget chooseDisplay() {
    if (!profile.checkImage()) {
      return const Icon(
        Icons.image_outlined,
        size: 300,
        color: Colors.pink,
      );
    }
    return Image.network(profile.imageurl);
  }

  Widget makeProfileList() {
    List<String> attributes = [
      profile.firstName,
      profile.lastName,
      profile.address,
      profile.postalCode
    ];
    return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: attributes.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.pink)),
            height: 50,
            child: Center(child: Text(attributes[index])),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider());
  }
}
