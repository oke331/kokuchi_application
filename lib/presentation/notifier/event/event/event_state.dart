import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/application/event_app_service.dart';
import 'package:kokuchi_event/application/event_report_app_service.dart';
import 'package:kokuchi_event/common/event_status_situation.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/auth/auth_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/share/network_check.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:state_notifier/state_notifier.dart';

part 'event_state.freezed.dart';

@freezed
abstract class EventState with _$EventState {
  const factory EventState({@Default(false) bool isLoading}) = _EventState;
}

class EventStateNotifier extends StateNotifier<EventState> with LocatorMixin {
  EventStateNotifier(
      {@required EventAppService app,
      @required EventReportAppService reportApp})
      : _app = app,
        _reportApp = reportApp,
        super(const EventState()) {}

  final EventAppService _app;
  final EventReportAppService _reportApp;

  String _userId;

  @override
  void update(Locator watch) {
    _userId = watch<AuthState>().id;
  }

  Future<void> remove(EventDetailState event) async {
    if (state.isLoading) return;

    // インターネット接続をチェック
    if (!await NetworkCheck.isConnect()) {
      throw InternetException();
    }

    loadingChange(val: true);
    try {
      // ステータスをdeleteにして、あとは他と同じ
      await _app.save(
          isDelete: true,
          id: event.id,
          userId: _userId,
          title: event.title,
          category: event.category,
          startDate: event.startDate,
          endDate: event.endDate,
          // deleteに変更
          status: EventStatusSituation.delete,
          online: event.online,
          text: event.text,
          venue: event.venue,
          joinUrl: event.joinUrl,
          tool: event.tool,
          phoneNumber: event.phoneNumber,
          email: event.email,
          mainImageFile: event.mainImageFile,
          beforeMainImageUrl: event.mainImageUrl,
          subImagesFile: [
            event.subImageFile1,
            event.subImageFile2,
            event.subImageFile3
          ],
          beforeSubImagesUrl: event.subImagesUrl,
          officialPageUrl: event.officialPageUrl,
          letsGoCount: event.letsGoCount,
          trashBeforeMainImage: false,
          trashBeforeSubImages: [false, false, false]);
      // Cloud Functionが起動するまでの間スリープする
      await Future<void>.delayed(const Duration(seconds: 10));
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      logger.d(e.toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      loadingChange(val: false);
    }
  }
  // removeに移動
//  Future<void> removeEventById(String eventId) async {
//    if (state.isLoading) return;
//    loadingChange(val: true);
//    try {
//      await _app.remove(_userId, eventId);
//      // Cloud Functionが起動するまでの間スリープする
//      await Future<void>.delayed(const Duration(seconds: 10));
//    } on GenericException catch (e,s) {
//        await commonToast(msg: e.message);
//      await FirebaseCrashlytics.instance.recordError(e, s);
//    } on Exception catch (e,s) {
//      logger.d(e.toString());
//     await commonToast(msg: CommonString.exceptionError);
//    } finally {
//      loadingChange(val: false);
//    }
//  }

  void loadingChange({bool val}) {
    state = state.copyWith(isLoading: val);
  }

  Future<void> reportEvent(
      {String eventId, String content, String otherId}) async {
    await _reportApp.reportEvent(
        otherId: otherId,
        myId: read<UserState>().id,
        eventId: eventId,
        content: content);
  }

  Future<EventDto> fetchEventFromDynamicLink(String eventId) async {
    return _app.findByEventId(eventId);
  }
}
