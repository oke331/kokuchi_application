import 'dart:io';

import 'package:flutter_native_image/flutter_native_image.dart';

class CommonCompressFile {
  static Future<File> compress(File file) async {
    final properties = await FlutterNativeImage.getImageProperties(file.path);
    return FlutterNativeImage.compressImage(file.path,
        quality: 80,
        targetWidth: 600,
        targetHeight: (properties.height * 600 / properties.width).round());
  }
}
