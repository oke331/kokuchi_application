import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/share/launch_url.dart';
import 'package:provider/provider.dart';

class EventDetailOfficialUrl extends StatelessWidget {
  const EventDetailOfficialUrl();

  @override
  Widget build(BuildContext context) {
    final url =
        context.select((EventDetailState value) => value.officialPageUrl);

    return InkWell(
      onTap: () async => launchURL(url),
      child: Text(url,
          style: const TextStyle(decoration: TextDecoration.underline)),
    );
  }
}
