import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/presentation/notifier/event/home_network/home_network_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/new_event/new_event_state.dart';
import 'package:kokuchi_event/presentation/widget/common/headline_and_refresh.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:kokuchi_event/presentation/widget/home/new_event_list.dart';
import 'package:kokuchi_event/presentation/widget/home/no_internet.dart';
import 'package:kokuchi_event/presentation/widget/home/online_event.dart';
import 'package:kokuchi_event/presentation/widget/home/prefecture_event.dart';
import 'package:kokuchi_event/presentation/widget/home/search/search_app_bar.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody();

  static ScrollController homeScrollController;

  @override
  Widget build(BuildContext context) {
    homeScrollController = ScrollController();

    homeScrollController.addListener(() async {
      await _scrollListener(context);
    });

    return SafeArea(
      child: CustomScrollView(
        controller: homeScrollController,
        slivers: <Widget>[
          const SearchAppBar(),
          !context.select((HomeNetworkState value) => value.init)
              ? SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      const SizedBox.shrink(),
                    ],
                  ),
                )
              : !context.select((HomeNetworkState value) => value.network)
                  ? SliverList(
                      delegate: SliverChildListDelegate(
                        <Widget>[
                          const HomeNoInternet(),
                        ],
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildListDelegate(
                        <Widget>[
                          const SizedBox(height: 20),
                          const HomePrefectureEvent(),
                          const SizedBox(height: 30),
                          const HomeOnlineEvent(),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
          SliverStickyHeader(
            header: CommonHeadLineAndRefresh(
              text: '新着イベント',
              onTap: () => context.read<NewEventState>().isLoading
                  ? null
                  : _onRefreshTap(context),
              loading: context.select((NewEventState value) => value.isLoading),
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(<Widget>[
                const HomeNewEventList(),
                const SizedBox(height: 20),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _scrollListener(BuildContext context) async {
    if (homeScrollController.offset >=
            homeScrollController.position.maxScrollExtent &&
        !homeScrollController.position.outOfRange) {
      await context.read<NewEventStateNotifier>().fetchAndAddNewEvents();
    }
  }

  Future<void> _onRefreshTap(BuildContext context) async {
    try {
      await context.read<NewEventStateNotifier>().refreshEvents();
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    }
  }
}
