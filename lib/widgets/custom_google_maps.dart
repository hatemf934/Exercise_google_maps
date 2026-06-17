import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMaps extends StatefulWidget {
  const CustomGoogleMaps({super.key});

  @override
  State<CustomGoogleMaps> createState() => _CustomGoogleMapsState();
}

class _CustomGoogleMapsState extends State<CustomGoogleMaps> {
  late CameraPosition initialCameraPosition;
  late GoogleMapController googleMapController;
  String? mapStyle;
  // Set<Marker> myMarker = {};
  // Set<Polyline> polylines = {};
  // Set<Polygon> polygons = {};
  // Set<Circle> circles = {};
  @override
  void initState() {
    super.initState();
    initpostion();
    initStyleMap();
    // initCircle(circles: circles);
    // intiMarker(myMarker: myMarker);
    // initPloyline(polylines: polylines);
    // initPolygon(polygons: polygons);
  }

  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            // polygons: polygons,
            // polylines: polylines,
            // markers: myMarker,
            // circles: circles,
            style: mapStyle,
            onMapCreated: (controller) {
              googleMapController = controller;
            },
            initialCameraPosition: initialCameraPosition,
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: ElevatedButton(
              onPressed: () {
                googleMapController.animateCamera(
                  CameraUpdate.newLatLng(
                    LatLng(31.14029646430617, 29.961015274730666),
                  ),
                );
              },
              child: Text("Change Position"),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 70,
            child: ElevatedButton(
              onPressed: () {
                googleMapController.animateCamera(
                  CameraUpdate.newLatLngZoom(
                    LatLng(30.03627326873406, 31.241834653739808),
                    7,
                  ),
                );
              },
              child: Text("Change zoom"),
            ),
          ),
        ],
      ),
    );
  }

  void initpostion() {
    initialCameraPosition = CameraPosition(
      target: LatLng(30.03627326873406, 31.241834653739808),
      zoom: 12,
    );
  }

  void initStyleMap() async {
    var mapNightStyle = await DefaultAssetBundle.of(
      context,
    ).loadString("assets/map_style/night_map_style.json");
    setState(() {
      mapStyle = mapNightStyle;
    });
  }
}
