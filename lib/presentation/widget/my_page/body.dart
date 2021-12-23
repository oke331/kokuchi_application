import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:kokuchi_event/application/event_app_service.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/domain/event/event_repository_base.dart';
import 'package:kokuchi_event/infrastructure/event/event_factory.dart';
import 'package:kokuchi_event/presentation/notifier/auth/auth_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/user_event_show/user_event_show_state.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';
import 'package:kokuchi_event/presentation/share/filter_block_user.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/common/headline_and_refresh.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:kokuchi_event/presentation/widget/event_list/card.dart';
import 'package:kokuchi_event/presentation/widget/event_list/list/vertical_list.dart';
import 'package:kokuchi_event/presentation/widget/my_page/card.dart';
import 'package:provider/provider.dart';

class MyPageBody extends StatelessWidget {
  const MyPageBody();

  static ScrollController myPageScrollController;

  @override
  Widget build(BuildContext context) {
    myPageScrollController = ScrollController();

    return SafeArea(
      child: MultiProvider(
        providers: [
          StateNotifierProvider<UserEventShowStateNotifier, UserEventShowState>(
            create: (context) => UserEventShowStateNotifier(
              userId: context.read<AuthState>().id,
              app: EventAppService(
                factory: const EventFactory(),
                repository: context.read<EventRepositoryBase>(),
              ),
            ),
          )
        ],
        child: Builder(
          builder: (context) {
            myPageScrollController.addListener(() async {
              await _scrollListener(context);
            });

            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CustomScrollView(
                  controller: myPageScrollController,
                  slivers: <Widget>[
                    _user(),
                    _postEventList(context),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    alignment: Alignment.centerLeft,
                    icon: Icon(Icons.settings),
                    onPressed: () => Navigator.of(context, rootNavigator: true)
                        .pushNamed(RouteName.setting),
                  ),
                ),
                context.select((UserEventShowState value) => value.isLoading) &&
                        context.select((UserEventShowState value) => value.init)
                    ? const Positioned(
                        bottom: 40,
                        child: CenterLoading(),
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _user() {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          const MyPageCard(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _postEventList(BuildContext context) {
    final events = FilterBlockUser.filterBlockUserFromEventDtos(
        context, context.select((UserEventShowState value) => value.events));

    return SliverStickyHeader(
      header: CommonHeadLineAndRefresh(
        text: '投稿イベント',
        onTap: () => _onRefreshTap(context),
        loading: context.select((UserEventShowState value) => value.isLoading),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(<Widget>[
          !context.select((UserEventShowState value) => value.init)
              ? const SizedBox.shrink()
              : events == null || events.isEmpty
                  ? const Center(
                      child: Text('イベントはありません。'),
                    )
                  : EventVerticalList(
                      events: events,
                      eventEditPop: EventEditPop.myPage,
                    ),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }

  Future<void> _onRefreshTap(BuildContext context) async {
    try {
      await context.read<UserEventShowStateNotifier>().refreshUserEvents();
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    }
  }

  Future<void> _scrollListener(BuildContext context) async {
    if (myPageScrollController.offset >=
            myPageScrollController.position.maxScrollExtent &&
        !myPageScrollController.position.outOfRange) {
      await context.read<UserEventShowStateNotifier>().fetchAndAddUserEvents();
    }
  }
}
