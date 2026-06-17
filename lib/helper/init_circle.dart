import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void initCircle({required Set<Circle> circles}) {
  Circle circle = Circle(
    fillColor: Colors.black.withAlpha(120),
    center: LatLng(30.150249515357057, 31.236456844456704),
    radius: 30000,
    circleId: CircleId("1"),
  );
  circles.add(circle);
}
