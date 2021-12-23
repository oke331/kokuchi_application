import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/domain/event_report/event_factory_base.dart';
import 'package:kokuchi_event/domain/event_report/event_repository_base.dart';
import 'package:kokuchi_event/presentation/share/network_check.dart';

class EventReportAppService {
  EventReportAppService(
      {@required EventReportRepositoryBase repository,
      @required EventReportFactoryBase factory})
      : _repository = repository,
        _factory = factory;

  final EventReportRepositoryBase _repository;
  final EventReportFactoryBase _factory;

  Future<void> reportEvent(
      {@required String myId,
      @required String otherId,
      @required String eventId,
      @required String content}) async {
    // インターネット接続をチェック
    if (!await NetworkCheck.isConnect()) {
      throw InternetException();
    }

    await _repository.reportEvent(_factory.create(
        myId: myId, otherId: otherId, eventId: eventId, content: content));
  }
}
