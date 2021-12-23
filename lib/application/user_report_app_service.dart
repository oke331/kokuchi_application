import 'package:flutter/cupertino.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/domain/user_report/user_report_factory_base.dart';
import 'package:kokuchi_event/domain/user_report/user_report_repository_base.dart';
import 'package:kokuchi_event/presentation/share/network_check.dart';

class UserReportAppService {
  UserReportAppService(
      {@required UserReportRepositoryBase reporrtRepository,
      @required UserReportFactoryBase reportFactory})
      : _reportFactory = reportFactory,
        _reportRepository = reporrtRepository;

  final UserReportFactoryBase _reportFactory;
  final UserReportRepositoryBase _reportRepository;

  Future<void> reportUser(
      {@required String myId,
      @required String otherId,
      @required String content}) async {
    // インターネット接続をチェック
    if (!await NetworkCheck.isConnect()) {
      throw InternetException();
    }

    await _reportRepository.reportUser(
        _reportFactory.create(myId: myId, otherId: otherId, content: content));
  }
}
