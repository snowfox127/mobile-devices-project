// ignore_for_file: avoid_web_libraries_in_flutter, avoid_print, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlng/latlng.dart';

class PointOfInterest {
  String name;
  String? location;
  String? city;
  String? province;
  String? phoneNumber;
  int? bedCount;
  String? system;
  LatLng? coordinates;
  String? description;

  PointOfInterest(this.name, this.location, this.city, this.province,
      this.phoneNumber, this.bedCount, this.system,
      [this.coordinates, this.description]);

  static Future<List<PointOfInterest>> retreivePOI() async {FirebaseFirestore.instance.collection('PointsOfInterest');
    final testdata = FirebaseFirestore.instance.collection('PointsOfInterest');
    var g = await testdata.get();
    List<PointOfInterest> pois = g.docs.map((doc) {
      print(doc.data()['coordinates']);
      return PointOfInterest(
        doc.data()['name'],
        doc.data()['location'],
        doc.data()['city'],
        doc.data()['province'],
        doc.data()['phoneNumber'],
        doc.data()['bedCount'],
        doc.data()['system'],
        LatLng(doc.data()['coordinates'].latitude,
            doc.data()['coordinates'].longitude),
      );
    }).toList();
    //print(pois[0]);
    // if (test.hasError) {
    //   print(snapshot.error);
    // }
    return pois;
  }
}


