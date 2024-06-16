import 'package:flutter/material.dart';
import 'package:mobile_project/app_drawer.dart';
import 'package:mobile_project/models/pointOfInterest.dart';

class HospitalInfo extends StatelessWidget {
  PointOfInterest? POI;
  HospitalInfo({Key? key, @required this.POI}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.pinkAccent,
          toolbarHeight: 90,
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          title: const Text("Hospitals Info",
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.bold))),
      body: Center(child: makeInfoList()),
    );
  }

  Widget makeInfoList() {
    int bc = POI?.bedCount ?? 0;
    String bedCount = "$bc";
    List<String> dataType = [
      POI?.location ?? "Unkown",
      POI?.city ?? "Unkown",
      POI?.province ?? "Unkown",
      POI?.phoneNumber ?? "Unkown",
      bedCount,
      "General Hospital",
      "OHIP"
    ];

    List<String> attributes = [
      "Location: ",
      "City: ",
      "Province: ",
      "Phone: ",
      "Number of Beds: ",
      "Type: ",
      "Care System: ",
    ];
    return ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: attributes.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.pink)),
            height: 50,
            child: Center(child: Text(attributes[index] + dataType[index])),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider());
  }
}
