import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/domain/event/event_repository_base.dart';
import 'package:kokuchi_event/domain/event/value/event_id.dart';
import 'package:kokuchi_event/domain/user/value/user_id.dart';

class EventLetsGoAppService {
  const EventLetsGoAppService({@required EventRepositoryBase repository})
      : _repository = repository;

  final EventRepositoryBase _repository;

  Future<void> letsGoAdd({
    @required String postUserId,
    @required String eventId,
    @required String myUserId,
  }) async {
    await _repository.letsGoAdd(
        postUserId: UserId(postUserId),
        eventId: EventId(eventId),
        myUserId: UserId(myUserId));
  }

  Future<void> letsGoDelete({
    @required String postUserId,
    @required String eventId,
    @required String myUserId,
  }) async {
    await _repository.letsGoDelete(
        postUserId: UserId(postUserId),
        eventId: EventId(eventId),
        myUserId: UserId(myUserId));
  }

  Future<LetsGoEventFetchDto> fetchLetsGos(
      {@required String userId,
      @required int limitNumber,
      DateTime startAfter}) async {
    final letsGoEventFetch = await _repository.fetchLetsGos(
        userId: UserId(userId),
        limitNumber: limitNumber,
        startAfter: startAfter);

    final eventDtos =
        letsGoEventFetch?.events?.map((e) => EventDto(e))?.toList();

    return LetsGoEventFetchDto(
        eventDtos: eventDtos, startAfter: letsGoEventFetch?.startAfter);
  }
}

class LetsGoEventFetchDto {
  LetsGoEventFetchDto({this.eventDtos, this.startAfter});

  final List<EventDto> eventDtos;
  final DateTime startAfter;
}
