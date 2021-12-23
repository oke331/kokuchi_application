import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/presentation/notifier/event/user_event_show/user_event_show_state.dart';
import 'package:kokuchi_event/presentation/share/filter_block_user.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/common/headline_and_refresh.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:kokuchi_event/presentation/widget/event_list/card.dart';
import 'package:kokuchi_event/presentation/widget/event_list/list/vertical_list.dart';
import 'package:kokuchi_event/presentation/widget/other_user_page/card.dart';
import 'package:kokuchi_event/presentation/widget/other_user_page/leadng.dart';
import 'package:kokuchi_event/presentation/widget/other_user_page/report.dart';
import 'package:provider/provider.dart';

class OtherUserPageBody extends StatelessWidget {
  OtherUserPageBody();

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() async {
      await _scrollListener(context);
    });

    return SafeArea(
        child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            _user(),
            _postEventList(context),
          ],
        ),
        context.select((UserEventShowState value) => value.isLoading)
            ? const Positioned(
                bottom: 40,
                child: CenterLoading(),
              )
            : const SizedBox.shrink(),
        const Align(
            alignment: Alignment.topLeft, child: OtherUserPageLeading()),
        const Align(
            alignment: Alignment.topRight, child: OtherUserPageReport()),
      ],
    ));
  }

  Widget _user() {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          const OtherUserPageCard(),
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
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      await context.read<UserEventShowStateNotifier>().fetchAndAddUserEvents();
    }
  }
}
