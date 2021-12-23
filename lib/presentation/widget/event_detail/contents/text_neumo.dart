import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/contents/text.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/neumo_headline.dart';

class EventDetailTextNeumo extends StatelessWidget {
  const EventDetailTextNeumo();

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      child: Column(children: const <Widget>[
        EventDetailNeumoHeadline(text: '- Content -'),
        SizedBox(height: 20),
        EventDetailText(),
        SizedBox(height: 10),
      ]),
    );
  }
}
