import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/domain/event/event_repository_base.dart';
import 'package:kokuchi_event/domain/user/value/user_prefecture.dart';
import 'package:kokuchi_event/presentation/share/network_check.dart';

class EventRecommendAppService {
  const EventRecommendAppService({@required EventRepositoryBase repository})
      : _repository = repository;

  final EventRepositoryBase _repository;

  Future<List<EventDto>> getEventsByPrefecture(
      {@required String prefecture}) async {
    // インターネット接続をチェック
    if (!await NetworkCheck.isConnect()) {
      throw InternetException();
    }
    final events = await _repository.getEventsByPrefecture(
        prefecture: UserPrefecture(prefecture));
    return events.map((e) => EventDto(e)).toList();
  }

  Future<List<EventDto>> getEventsByOnline() async {
    // インターネット接続をチェック
    if (!await NetworkCheck.isConnect()) {
      throw InternetException();
    }
    final events = await _repository.getEventsByOnline();
    return events.map((e) => EventDto(e)).toList();
  }
}
