import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

Future<Uint8List> getImageFromRowData(String imagePath, double width) async {
  var imageData = await rootBundle.load(imagePath);
  var imageCodec = await ui.instantiateImageCodec(
    imageData.buffer.asUint8List(),
    targetWidth: width.round(),
  );
  var imageFromInfo = await imageCodec.getNextFrame();
  var imageByByte = await imageFromInfo.image.toByteData(
    format: ui.ImageByteFormat.png,
  );
  return imageByByte!.buffer.asUint8List();
}
