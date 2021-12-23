import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:provider/provider.dart';

class EventDetailTitle extends StatelessWidget {
  const EventDetailTitle();

  @override
  Widget build(BuildContext context) {
    final fontSize = Theme.of(context).textTheme.headline6.fontSize;

    return Flexible(
      child: Text(
        context.select((EventDetailState value) => value.title),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}
