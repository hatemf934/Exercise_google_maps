import 'package:google_maps_flutter/google_maps_flutter.dart';

void initPolygon({required Set<Polygon> polygons}) {
  Polygon polygon = Polygon(
    strokeWidth: 3,
    holes: [
      [
        LatLng(27.358243280573095, 26.121606453253143),
        LatLng(27.058553146870967, 24.70630131615349),
        LatLng(24.632657320686693, 25.64983807421993),
      ],
    ],
    points: [
      LatLng(30.309711407988374, 28.952216727452445),
      LatLng(29.491780100375877, 22.54964586914451),
      LatLng(23.27771563782435, 24.167137454401246),
      LatLng(22.90574273852899, 28.480448348419227),
    ],
    polygonId: PolygonId("1"),
  );
  polygons.add(polygon);
}
