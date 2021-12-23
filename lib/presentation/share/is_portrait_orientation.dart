import 'package:flutter/cupertino.dart';

bool isPortraitOrientation({@required double aspectRatio}) {
  return aspectRatio < 0.7;
}
