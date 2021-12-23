import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';

class CommonIconShow extends StatelessWidget {
  const CommonIconShow({double size, String iconUrl, File iconFile})
      : _size = size,
        _iconUrl = iconUrl,
        _iconFile = iconFile;

  final double _size;
  final String _iconUrl;
  final File _iconFile;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Neumorphic(
        padding: const EdgeInsets.all(5),
        style: NeumorphicStyle(
          boxShape: const NeumorphicBoxShape.circle(),
          depth: NeumorphicTheme.embossDepth(context),
        ),
        child: _iconFile != null
            ? GestureDetector(
                child: CircleAvatar(
                  backgroundImage: FileImage(_iconFile),
                  radius: _size / 2,
                ),
                onTap: () => Navigator.of(context, rootNavigator: true)
                    .pushNamed(RouteName.imageShow,
                        arguments: [null, _iconFile]),
              )
            : _iconUrl != null
                ? GestureDetector(
                    onTap: () => Navigator.of(context, rootNavigator: true)
                        .pushNamed(RouteName.imageShow,
                            arguments: [_iconUrl, null]),
                    child: CircleAvatar(
                      radius: _size / 2,
                      child: CachedNetworkImage(
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
                          ),
                        ),
                        imageUrl: _iconUrl,
//                      placeholder: (context, url) => CircularProgressIndicator(
//                        strokeWidth: 2,
//                        backgroundColor: Colors.green,
//                      ),
                        errorWidget: (context, url, dynamic error) =>
                            Icon(Icons.error),
                      ),
                    ),
                  )
                : Icon(
                    Icons.insert_emoticon,
                    size: _size,
                    color: Colors.black.withOpacity(0.2),
                  ),
      ),
    );
  }
}
