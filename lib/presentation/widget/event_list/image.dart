import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/presentation/widget/event_list/card.dart';
import 'package:provider/provider.dart';

class EventImage extends StatelessWidget {
  const EventImage();

  @override
  Widget build(BuildContext context) {
    final mainImageUrl = context.select((EventDto value) => value.mainImageUrl);
    final isFinished = _isFinishedEvent(context);

    return AspectRatio(
      aspectRatio: 12 / 7,
      child: Neumorphic(
        padding: const EdgeInsets.all(5),
        style: NeumorphicStyle(
            depth: NeumorphicTheme.embossDepth(context),
            color: isFinished ? EventCard.finishBackColor : null),
        child: mainImageUrl != null
            ? CachedNetworkImage(
                imageUrl: mainImageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                errorWidget: (context, url, dynamic error) => Icon(Icons.error),
              )
            : Image.asset(
                'assets/images/main_image.png',
                fit: BoxFit.cover,
              ),
      ),
    );
  }

  bool _isFinishedEvent(BuildContext context) {
    final endDate = context.select((EventDto value) => value.endDate);
    if (DateTime.now().isAfter(endDate)) {
      return true;
    }
    return false;
  }
}
