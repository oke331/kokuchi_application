import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/domain/event/event_repository_base.dart';
import 'package:kokuchi_event/domain/event/value/event_id.dart';
import 'package:kokuchi_event/domain/user/value/user_id.dart';

class EventNewAppService {
  EventNewAppService({@required EventRepositoryBase repository})
      : _repository = repository;

  final EventRepositoryBase _repository;

  Future<List<EventDto>> fetchNewEvent({DateTime startAfter}) async {
    final events = await _repository.fetchNewEvent(20, startAfter: startAfter);
    return events.map((e) => EventDto(e)).toList();
  }

  Future<EventDto> findByUserIdAndEventId(String userId, String eventId) async {
    final event = await _repository.findByUserIdAndEventId(
        UserId(userId), EventId(eventId));
    return EventDto(event);
  }
}
