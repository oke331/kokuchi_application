import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/event/home_online/home_online_state.dart';
import 'package:kokuchi_event/presentation/share/filter_block_user.dart';
import 'package:kokuchi_event/presentation/widget/common/headline_and_refresh.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:kokuchi_event/presentation/widget/event_list/card.dart';
import 'package:kokuchi_event/presentation/widget/event_list/list/horizon_list.dart';
import 'package:provider/provider.dart';

class HomeOnlineEvent extends StatelessWidget {
  const HomeOnlineEvent();

  @override
  @override
  Widget build(BuildContext context) {
    final events = FilterBlockUser.filterBlockUserFromEventDtos(
        context, context.select((HomeOnlineState value) => value.eventDtos));

    return Column(
      children: <Widget>[
        CommonHeadLineAndRefresh(
          text: '注目オンラインイベント',
          onTap: () => context.read<HomeOnlineState>().isLoading
              ? null
              : _onTap(context),
          loading: context.select((HomeOnlineState value) => value.isLoading),
        ),
        !context.select((HomeOnlineState value) => value.init)
            ? const SizedBox.shrink()
            : events == null || events.isEmpty
                ? const Center(
                    child: Text('おすすめイベントはまだありません。'),
                  )
                : EventHorizonList(
                    events: events,
                    eventEditPop: EventEditPop.homeOnline,
                  ),
      ],
    );
  }

  Future<void> _onTap(BuildContext context) async {
    try {
      await context.read<HomeOnlineStateNotifier>().getEventsByOnline();
    } on Exception catch (e, s) {
      logger.d(e.toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    }
  }
}
