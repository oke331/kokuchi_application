import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';
import 'package:provider/provider.dart';

class EventDetailActionEdit extends StatelessWidget {
  const EventDetailActionEdit();

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: const NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(), depth: 3),
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      onPressed: () async => _onPressed(context),
      child: const Icon(Icons.edit),
    );
  }

  void _onPressed(BuildContext context) {
    final eventDetailData = context.read<EventDetailState>();
    Navigator.pushNamed(context, RouteName.postEdit,
        arguments: eventDetailData);
  }
}
