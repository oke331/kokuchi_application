import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/widget/common/icon/icon_no_image.dart';

class CommonIconEdit extends StatelessWidget {
  const CommonIconEdit(
      {@required VoidCallback onTap,
      String iconUrl,
      File iconFile,
      @required bool isTrash})
      : _onTap = onTap,
        _isTrash = isTrash,
        _iconUrl = iconUrl,
        _iconFile = iconFile;

  final bool _isTrash;
  final VoidCallback _onTap;
  final String _iconUrl;
  final File _iconFile;

  static const double avatarSize = 120;
//  static const iconFit = BoxFit.fill;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: const Alignment(0.6, 0.6),
        children: [
          Neumorphic(
            padding: const EdgeInsets.all(5),
            style: NeumorphicStyle(
              boxShape: const NeumorphicBoxShape.circle(),
              depth: NeumorphicTheme.embossDepth(context),
            ),
            child: GestureDetector(
              onTap: _onTap,
              child: _isTrash
                  ? const IconNoImage(avatorSize: avatarSize)
                  : _iconFile != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(_iconFile),
                          radius: avatarSize / 2,
                        )
                      : _iconUrl != null
                          ? CircleAvatar(
                              radius: avatarSize / 2,
                              child: CachedNetworkImage(
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                imageUrl: _iconUrl,
                                errorWidget: (context, url, dynamic error) =>
                                    const Icon(Icons.error),
                              ),
                            )
                          : const IconNoImage(avatorSize: avatarSize),
            ),
          ),
          const Icon(Icons.camera_alt),
        ],
      ),
    );
  }
}
