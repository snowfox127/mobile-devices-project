// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:mobile_project/hospitals_page.dart';
import 'package:mobile_project/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final testdata = FirebaseFirestore.instance.collection('PointsOfInterest');
  @override
  //testdata.snapshots(),
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: testdata.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Container(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(child: Text("Loading"));
        }

        return Scaffold(
          appBar: AppBar(
            title: Text("Test"),
          ),
          body: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              print(data['coordinates'].runtimeType);
              print(data['coordinates'].longitude);
              print(data['coordinates'].latitude);
              return ListTile(
                title: Text(data['name']),
                subtitle: Text(data['province']),
              );
            },
          ),
        );
      },
    );
  }
}
