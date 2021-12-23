import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/presentation/share/datetime_and_weekday.dart';
import 'package:provider/provider.dart';

class EventDate extends StatelessWidget {
  const EventDate();

  @override
  Widget build(BuildContext context) {
    final startDateDateTime =
        context.select((EventDto value) => value.startDate);
    final endDateDateTime = context.select((EventDto value) => value.endDate);

    final val = dateTimeAndWeekDay(startDateDateTime, endDateDateTime);

    return Text(
      val,
      style: const TextStyle(fontSize: 11.7),
      overflow: TextOverflow.ellipsis,
    );
  }
}
