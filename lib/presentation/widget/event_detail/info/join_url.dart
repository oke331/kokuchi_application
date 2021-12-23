import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/share/launch_url.dart';
import 'package:provider/provider.dart';

class EventDetailJoinUrl extends StatelessWidget {
  const EventDetailJoinUrl();

  @override
  Widget build(BuildContext context) {
    final url = context.select((EventDetailState value) => value.joinUrl);

    return InkWell(
      onTap: () async => launchURL(url),
      child: Text(
        url,
        style: TextStyle(decoration: TextDecoration.underline),
      ),
    );
  }
}
