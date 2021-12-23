import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:provider/provider.dart';

class EventDetailCategory extends StatelessWidget {
  const EventDetailCategory();

  @override
  Widget build(BuildContext context) {
    return Text(
      '#${context.select((EventDetailState value) => value.category)}',
      style: const TextStyle(color: Colors.green),
    );
  }
}
