import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/presentation/share/is_portrait_orientation.dart';
import 'package:provider/provider.dart';

class EventVenue extends StatelessWidget {
  const EventVenue();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Icon(
          Icons.room,
          color: Colors.black54,
          size: 21,
        ),
        Flexible(
          child: Text(
            context.select((EventDto value) => value.venue),
            style: const TextStyle(color: Colors.black54, fontSize: 12),
            maxLines:
                isPortraitOrientation(aspectRatio: size.aspectRatio) ? 2 : 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
