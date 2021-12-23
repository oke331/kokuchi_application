import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:kokuchi_event/application/event_new_app.dart';
import 'package:kokuchi_event/application/event_recommend_app_service.dart';
import 'package:kokuchi_event/common/event_status_situation.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/domain/event/event_repository_base.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/auth/auth_state.dart';
import 'package:kokuchi_event/presentation/notifier/block_user/block_user_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/event/event_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/home_network/home_network_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/home_online/home_online_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/home_prefecture/home_prefecture_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/new_event/new_event_state.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';
import 'package:kokuchi_event/presentation/share/filter_block_user.dart';
import 'package:kokuchi_event/presentation/share/sns_share_dynamic_link.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:kokuchi_event/presentation/widget/home/body.dart';
import 'package:provider/provider.dart';

// シェア機能で画面遷移->イベント削除->再度InitialLinkでイベントに遷移する
// という不具合を改善するため、一度イベントを開いたという状態を持つ。
// アプリをキルするとfalseに戻るため、はじめのキル状態から復帰して一度だけ通るようにできる。
bool isNoLoadShareEventWindow = false;

class Home extends StatelessWidget {
  const Home();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future<Duration>.delayed(const Duration(seconds: 2));
      final data = await FirebaseDynamicLinks.instance.getInitialLink();
      final deepLink = data?.link;

      if (!isNoLoadShareEventWindow) {
        // ターミネート状態から
        if (deepLink != null) {
          final queryMap = deepLink.queryParameters;
          // イベントを開く
          if (queryMap.isNotEmpty &&
              queryMap[SnsShareDynamicLink.queryEventId] != null) {
            isNoLoadShareEventWindow = true;
            final eventId = queryMap[SnsShareDynamicLink.queryEventId];
            await _getDynamicLink(context, eventId);
          }
        }
      }

      // バックグラウンドからURLでアプリに遷移してきた場合
      FirebaseDynamicLinks.instance.onLink(
          onSuccess: (PendingDynamicLinkData dynamicLink) async {
        final queryMap = dynamicLink.link.queryParameters;

        // イベントを開く
        if (queryMap.isNotEmpty &&
            queryMap[SnsShareDynamicLink.queryEventId] != null) {
          final eventId = queryMap[SnsShareDynamicLink.queryEventId];
          await _getDynamicLink(context, eventId);
        }
      });
    });

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: MultiProvider(providers: [
          StateNotifierProvider<HomeNetworkStateNotifier, HomeNetworkState>(
            create: (context) => HomeNetworkStateNotifier(),
          ),
          StateNotifierProvider<HomePrefectureStateNotifier,
              HomePrefectureState>(
            create: (context) => HomePrefectureStateNotifier(
              app: EventRecommendAppService(
                repository: context.read<EventRepositoryBase>(),
              ),
            ),
          ),
          StateNotifierProvider<HomeOnlineStateNotifier, HomeOnlineState>(
            create: (context) => HomeOnlineStateNotifier(
              app: EventRecommendAppService(
                repository: context.read<EventRepositoryBase>(),
              ),
            ),
          ),
          StateNotifierProvider<NewEventStateNotifier, NewEventState>(
            create: (context) => NewEventStateNotifier(
              app: EventNewAppService(
                repository: context.read<EventRepositoryBase>(),
              ),
            ),
          ),
        ], child: const HomeBody()),
      ),
    );
  }

  Future<void> _getDynamicLink(BuildContext context, String eventId) async {
    final userId = context.read<AuthState>().id;
    if (userId == null || userId.isEmpty) {
      await commonToast(msg: 'ログインを行ってください！');
      return;
    }

    try {
      final eventDto = await context
          .read<EventStateNotifier>()
          .fetchEventFromDynamicLink(eventId);

      if (eventDto.status == EventStatusSituation.reject ||
          eventDto.status == EventStatusSituation.delete) {
        await commonToast(msg: '既に非表示となっているイベントのため、閲覧できません。');
        return;
      }

      // ブロックしているイベントかチェック
      final otherId = eventDto.author.id;
      final isBlockedUser = context.read<BlockUserState>().isBlockedUsersDto;
      final blockUser = context.read<BlockUserState>().blockUsersDto;
      if (FilterBlockUser.checkNGBlockBeforeEventDetailShow(
          blockUser: blockUser,
          isBlockedUser: isBlockedUser,
          userId: otherId)) return;

      await Navigator.of(context, rootNavigator: true)
          .pushNamed(RouteName.eventDetail, arguments: eventDto);
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      logger.d(e.toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    }
  }
}
