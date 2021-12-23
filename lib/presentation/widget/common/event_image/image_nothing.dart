import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ImageNothing extends StatelessWidget {
  const ImageNothing({@required double size}) : _size = size;

  final double _size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.image,
      size: _size,
      color: Colors.black.withOpacity(0.2),
    );
  }
}
