import 'package:flutter/material.dart';
import 'package:flutter_with_google_maps/widgets/custom_google_maps.dart';

void main() {
  runApp(const GoogleApp());
}

class GoogleApp extends StatelessWidget {
  const GoogleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomGoogleMaps(),
    );
  }
}
