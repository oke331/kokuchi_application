import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ImageShow extends StatelessWidget {
  const ImageShow({@required String imageUrl, @required File imageFile})
      : _imageUrl = imageUrl,
        _imageFile = imageFile;

  final String _imageUrl;
  final File _imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(),
      body: SafeArea(
        child: Center(
          child: _imageFile != null
              ? Image.file(
                  _imageFile,
                  fit: BoxFit.fill,
                )
              : CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: _imageUrl,
//                  placeholder: (context, url) => CircularProgressIndicator(
//                    backgroundColor: Colors.green,
//                  ),
                  errorWidget: (context, url, dynamic error) =>
                      Icon(Icons.error),
                ),
        ),
      ),
    );
  }
}
