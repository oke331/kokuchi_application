import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';

class EventDetailVenue extends StatelessWidget {
  const EventDetailVenue();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        context.select((EventDetailState value) => value.venue),
        style: TextStyle(decoration: TextDecoration.underline),
      ),
      onTap: () async => _onTap(context),
    );
  }

  Future<void> _onTap(BuildContext context) async {
    await MapsLauncher.launchQuery(context.read<EventDetailState>().venue);
  }
}
