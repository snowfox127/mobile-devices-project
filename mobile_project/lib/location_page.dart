import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobile_project/app_drawer.dart';
import 'navigationbar.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScaffoldBodyContent(),
        drawer: const AppDrawer(),
        appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.pinkAccent,
            toolbarHeight: 90,
            title: const Text("Location",
                style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 25,
                    fontWeight: FontWeight.bold))),
        bottomNavigationBar: const NavBar());
  }
}

class ScaffoldBodyContent extends StatelessWidget {
  final center = LatLng(43.9644879, -78.89896);

  @override
  Widget build(BuildContext context) {
    return loadMap();
  }
}

List<Marker> _markers = [];
Widget loadMap() {
  return StreamBuilder<QuerySnapshot>(
    stream:
        FirebaseFirestore.instance.collection('PointsOfInterest').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return Text("Loading Maps");
      for (int i = 0; i < (snapshot.data! as QuerySnapshot).docs.length; i++) {
        _markers.add(new Marker(
            point: new LatLng(
                (snapshot.data! as QuerySnapshot)
                    .docs[i]['coordinates']
                    .latitude,
                (snapshot.data! as QuerySnapshot)
                    .docs[i]['coordinates']
                    .longitude),
            builder: (BuildContext context) {
              return IconButton(
                onPressed: () {},
                icon: Icon(Icons.location_on),
                iconSize: 30.0,
                color: Colors.blueAccent,
              );
            }));
      }
      // ignore: unnecessary_new
      return new FlutterMap(
        options: new MapOptions(center: new LatLng(43.9644879, -78.89896)),
        layers: [
          new TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/mikew24/ckwqqojfr0r6n14nufwud76ip/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWlrZXcyNCIsImEiOiJja3dxcWx0cWYwbXpzMnZydTg1cm9tdTQyIn0.XQ-Is-hJMRP35Ty0kJ6LBg",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoibWlrZXcyNCIsImEiOiJja3dxcWx0cWYwbXpzMnZydTg1cm9tdTQyIn0.XQ-Is-hJMRP35Ty0kJ6LBg',
                'id': 'mapbox.mapbox-streets-v8'
              }),
          MarkerLayerOptions(markers: _markers)
        ],
      );
    },
  );
}
