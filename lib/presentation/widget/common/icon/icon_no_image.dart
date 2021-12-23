import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class IconNoImage extends StatelessWidget {
  const IconNoImage({@required double avatorSize}) : _avatorSize = avatorSize;

  final double _avatorSize;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.insert_emoticon,
      size: _avatorSize,
      color: Colors.black.withOpacity(0.2),
    );
  }
}
