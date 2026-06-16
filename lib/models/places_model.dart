import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesModel {
  final int id;
  final String name;
  final LatLng latLng;

  PlacesModel({required this.id, required this.name, required this.latLng});
}

List<PlacesModel> places = [
  PlacesModel(
    id: 1,
    name: "قلعه ثلاح الدين",
    latLng: LatLng(30.028276588380496, 31.255375406039626),
  ),
  PlacesModel(
    id: 2,
    name: "باب زويله",
    latLng: LatLng(30.045366499074536, 31.256577035624883),
  ),
  PlacesModel(
    id: 3,
    name: "مسجد الحاكم بامر الله",
    latLng: LatLng(30.056213347658115, 31.26310016765915),
  ),
];
