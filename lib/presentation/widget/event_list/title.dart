import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/presentation/share/is_portrait_orientation.dart';
import 'package:provider/provider.dart';

class EventTitle extends StatelessWidget {
  const EventTitle();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Text(
      context.select((EventDto value) => value.title),
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      textAlign: TextAlign.center,
      maxLines: isPortraitOrientation(aspectRatio: size.aspectRatio) ? 2 : 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
