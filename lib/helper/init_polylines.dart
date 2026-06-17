import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void initPloyline({required Set<Polyline> polylines}) {
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
