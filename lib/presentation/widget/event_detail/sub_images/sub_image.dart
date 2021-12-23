import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';

class EventDetailSubImage extends StatelessWidget {
  const EventDetailSubImage(
      {File subImageFile, String subImageUrl, @required double widthSplit})
      : _subImageFile = subImageFile,
        _subImageUrl = subImageUrl,
        _widthSplit = widthSplit;

  final String _subImageUrl;
  final File _subImageFile;
  final double _widthSplit;
  static const _imageFit = BoxFit.cover;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: _widthSplit,
        height: _widthSplit,
        child: GestureDetector(
          child: Neumorphic(
            padding: const EdgeInsets.all(5),
            style: NeumorphicStyle(
              depth: NeumorphicTheme.embossDepth(context),
            ),
            child: _subImageFile != null
                ? Image.file(
                    _subImageFile,
                    fit: _imageFit,
                  )
                : _subImageUrl != null
                    ? CachedNetworkImage(
                        fit: _imageFit,
                        imageUrl: _subImageUrl,
//                      placeholder: (context, url) => CircularProgressIndicator(
//                        backgroundColor: Colors.green,
//                      ),
                        errorWidget: (context, url, dynamic error) =>
                            Icon(Icons.error),
                      )
                    : Icon(
                        Icons.image,
                        size: 30,
                        color: Colors.black.withOpacity(0.2),
                      ),
          ),
          onTap: () => _onTap(context),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    Navigator.of(context).pushNamed(RouteName.imageShow,
        arguments: [_subImageUrl, _subImageFile]);
  }
}
