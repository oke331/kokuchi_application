import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/share/datetime_and_weekday.dart';
import 'package:provider/provider.dart';

class EventDetailDate extends StatelessWidget {
  const EventDetailDate();

  @override
  Widget build(BuildContext context) {
    final startDateDateTime =
        context.select((EventDetailState value) => value.startDate);
    final endDateDateTime =
        context.select((EventDetailState value) => value.endDate);

    final val = dateTimeAndWeekDay(startDateDateTime, endDateDateTime);

    return Text(val);
  }
}
