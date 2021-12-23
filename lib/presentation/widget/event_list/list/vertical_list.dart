import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/presentation/share/is_portrait_orientation.dart';
import 'package:kokuchi_event/presentation/widget/event_list/card.dart';

class EventVerticalList extends StatelessWidget {
  const EventVerticalList(
      {@required List<EventDto> events, @required EventEditPop eventEditPop})
      : _eventEditPop = eventEditPop,
        _events = events;

  final List<EventDto> _events;
  final EventEditPop _eventEditPop;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount:
          isPortraitOrientation(aspectRatio: size.aspectRatio) ? 2 : 3,
      shrinkWrap: true,
      childAspectRatio:
          isPortraitOrientation(aspectRatio: size.aspectRatio) ? 0.59 : 0.7,
      children: <Widget>[
        ..._events
            .map((e) => EventCard(
                  eventDto: e,
                  eventEditPop: _eventEditPop,
                ))
            .toList()
      ],
    );
  }
}
