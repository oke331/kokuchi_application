import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'image_nothing.dart';

class CommonImageEdit extends StatelessWidget {
  const CommonImageEdit(
      {@required VoidCallback onTap,
      String imageUrl,
      File imageFile,
      BoxFit imageFit,
      @required bool isTrash})
      : _onTap = onTap,
        _imageUrl = imageUrl,
        _imageFile = imageFile,
        _imageFit = imageFit,
        _isTrash = isTrash;

  final VoidCallback _onTap;
  final String _imageUrl;
  final File _imageFile;
  final BoxFit _imageFit;
  final bool _isTrash;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Center(
        child: Stack(
          alignment: const Alignment(0.6, 0.6),
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              child: Neumorphic(
                padding: const EdgeInsets.all(10),
                style: NeumorphicStyle(
                  depth: NeumorphicTheme.embossDepth(context),
                ),
                child: _isTrash
                    ? const ImageNothing(size: 30)
                    : _imageFile != null
                        ? Image.file(_imageFile, fit: _imageFit)
                        : _imageUrl != null
                            ? CachedNetworkImage(
                                fit: _imageFit,
                                imageUrl: _imageUrl,
                                errorWidget: (context, url, dynamic error) =>
                                    const Icon(Icons.error),
                              )
                            : const ImageNothing(size: 30),
              ),
            ),
            const Icon(Icons.camera_alt),
          ],
        ),
      ),
      onTap: _onTap,
    );
  }
}
