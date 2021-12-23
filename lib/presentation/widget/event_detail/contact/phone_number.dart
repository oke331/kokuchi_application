import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/share/launch_url.dart';
import 'package:provider/provider.dart';

class EventDetailPhoneNumber extends StatelessWidget {
  const EventDetailPhoneNumber();

  @override
  Widget build(BuildContext context) {
    final phoneNumber =
        context.select((EventDetailState value) => value.phoneNumber);

    return InkWell(
      child: Text(
        phoneNumber,
        style:
            const TextStyle(fontSize: 16, decoration: TextDecoration.underline),
      ),
      onTap: () async => launchURL('tel://$phoneNumber'),
    );
  }
}
