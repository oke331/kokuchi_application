import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/share/launch_url.dart';
import 'package:provider/provider.dart';

class EventDetailEmail extends StatelessWidget {
  const EventDetailEmail();

  @override
  Widget build(BuildContext context) {
    final email = context.select((EventDetailState value) => value.email);

    return InkWell(
      child: Text(
        email,
        style:
            const TextStyle(fontSize: 16, decoration: TextDecoration.underline),
      ),
      onTap: () async => launchURL('mailto:$email'),
    );
  }
}
