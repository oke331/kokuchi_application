import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';
import 'package:provider/provider.dart';

class EventDetailAppBarFlexibleSpace extends StatelessWidget {
  const EventDetailAppBarFlexibleSpace();

  @override
  Widget build(BuildContext context) {
    final mainImageFile =
        context.select((EventDetailState value) => value.mainImageFile);
    final mainImageUrl =
        context.select((EventDetailState value) => value.mainImageUrl);

    if (mainImageFile == null && mainImageUrl == null) {
      return Image.asset(
        'assets/images/main_image.png',
        fit: BoxFit.cover,
      );
    }
    return mainImageFile != null
        ? InkWell(
            child: Image.file(
              mainImageFile,
              fit: BoxFit.fitWidth,
              errorBuilder: (context, e, s) {
                return const Icon(Icons.image);
              },
            ),
            onTap: () => Navigator.of(context).pushNamed(RouteName.imageShow,
                arguments: [null, mainImageFile]),
          )
        : InkWell(
            child: CachedNetworkImage(
              imageUrl: mainImageUrl,
              fit: BoxFit.fitWidth,
              errorWidget: (context, u, dynamic e) {
                return const Icon(Icons.image);
              },
            ),
            onTap: () => Navigator.of(context).pushNamed(RouteName.imageShow,
                arguments: [mainImageUrl, null]),
          );
  }
}
