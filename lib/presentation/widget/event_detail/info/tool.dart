import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:provider/provider.dart';

class EventDetailTool extends StatelessWidget {
  const EventDetailTool();

  @override
  Widget build(BuildContext context) {
    return Text(context.select((EventDetailState value) => value.tool));
  }
}
