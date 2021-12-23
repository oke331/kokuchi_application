import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:provider/provider.dart';

class EventCategory extends StatelessWidget {
  const EventCategory();

  @override
  Widget build(BuildContext context) {
    return Text(
      '#${context.select((EventDto value) => value.category)}',
      style: const TextStyle(color: Colors.green, fontSize: 12),
    );
  }
}
