import 'package:flutter/material.dart';
import 'package:mobile_project/app_drawer.dart';
import 'package:mobile_project/hospital.dart';
import 'package:mobile_project/models/pointOfInterest.dart';
import 'package:mobile_project/hospital_info.dart';
import 'navigationbar.dart';

class HospitalsPage extends StatefulWidget {
  @override
  _HospitalsPageState createState() => _HospitalsPageState();
}

class _HospitalsPageState extends State<HospitalsPage> {
  List<Hospital> hospitals = Hospital.generateData();
  int selectedIndex = 0;
  List<PointOfInterest>? pointsOfInterest;
  @override
  void initState() {
    super.initState();
    PointOfInterest.retreivePOI().then((data) => {
          setState(() {
            this.pointsOfInterest = data;
          })
        });
  }

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
                icon: const Icon(Icons.logout),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
            title: const Text("Hospitals",
                style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold))),
        body: pointsOfInterest != null
            ? Container(
                margin: EdgeInsets.all(30),
                child: ListView.builder(
                    itemCount: pointsOfInterest!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HospitalInfo(
                                        POI: this.pointsOfInterest![index])));
                          },
                          title: Text(
                            pointsOfInterest![index].name,
                            style: const TextStyle(
                                color: Colors.pinkAccent, fontSize: 18),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink)),
                      );
                    }))
            : Container(
                child: Text("Loading"),
              ),
        bottomNavigationBar: const NavBar());
  }
}
