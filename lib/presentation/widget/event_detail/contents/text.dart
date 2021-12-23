import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:provider/provider.dart';

class EventDetailText extends StatelessWidget {
  const EventDetailText();

  @override
  Widget build(BuildContext context) {
    return Text(
      context.select((EventDetailState value) => value.text),
      style: const TextStyle(fontSize: 16),
    );
  }
}
