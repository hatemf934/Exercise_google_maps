import 'package:flutter/material.dart';
import 'package:flutter_with_google_maps/helper/get_image_from_row_data.dart';
import 'package:flutter_with_google_maps/models/places_model.dart';
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
  Set<Marker> myMarker = {};
  Set<Polyline> polylines = {};
  @override
  void initState() {
    super.initState();
    initpostion();
    initStyleMap();
    intiMarker();
    initPloyline();
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
            polylines: polylines,
            markers: myMarker,
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

  void intiMarker() async {
    // change size of customIconMarker from bytes
    var customIconMarker = BitmapDescriptor.bytes(
      await getImageFromRowData("assets/images/google-maps.png", 100),
    );

    //customIconMarker from assets

    //  BitmapDescriptor.asset(
    //   ImageConfiguration(),
    //   "assets/images/google-maps.png",
    // );
    var markers = places.map((palcesModel) {
      return Marker(
        icon: customIconMarker,
        infoWindow: InfoWindow(title: palcesModel.name),
        position: palcesModel.latLng,
        markerId: MarkerId(palcesModel.id.toString()),
      );
    }).toSet();
    myMarker.addAll(markers);
  }

  void initPloyline() {
    Polyline polyline1 = Polyline(
      color: Colors.red,
      startCap: Cap.roundCap,
      // patterns: [PatternItem.dot],
      zIndex: 1,
      points: [
        LatLng(29.992870023817286, 31.261876168733952),
        LatLng(30.02527561784588, 31.211064403414383),
      ],
      polylineId: PolylineId("1"),
    );
    Polyline polyline2 = Polyline(
      color: Colors.blue,
      startCap: Cap.roundCap,
      points: [
        LatLng(29.99465409326671, 31.23612696333552),
        LatLng(30.039839820554775, 31.240246836199272),
      ],
      polylineId: PolylineId("2"),
    );
    polylines.add(polyline1);
    polylines.add(polyline2);
  }
}
