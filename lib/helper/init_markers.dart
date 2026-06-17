import 'package:flutter_with_google_maps/helper/get_image_from_row_data.dart';
import 'package:flutter_with_google_maps/models/places_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void intiMarker({required Set<Marker> myMarker}) async {
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
