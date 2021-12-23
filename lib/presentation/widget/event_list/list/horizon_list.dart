import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/presentation/widget/event_list/card.dart';

class EventHorizonList extends StatelessWidget {
  const EventHorizonList(
      {@required List<EventDto> events, @required EventEditPop eventEditPop})
      : _eventEditPop = eventEditPop,
        _events = events;

  final List<EventDto> _events;
  final EventEditPop _eventEditPop;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: 350,
      width: size.width,
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 1.6,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: <Widget>[
          ..._events
              .map((e) => EventCard(
                    eventDto: e,
                    eventEditPop: _eventEditPop,
                  ))
              .toList(),
        ],
      ),
    );
  }
}
