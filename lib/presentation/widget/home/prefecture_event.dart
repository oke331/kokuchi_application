import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/home_prefecture/home_prefecture_state.dart';
import 'package:kokuchi_event/presentation/share/filter_block_user.dart';
import 'package:kokuchi_event/presentation/widget/common/headline_and_refresh.dart';
import 'package:kokuchi_event/presentation/widget/event_list/card.dart';
import 'package:kokuchi_event/presentation/widget/event_list/list/horizon_list.dart';
import 'package:provider/provider.dart';

class HomePrefectureEvent extends StatelessWidget {
  const HomePrefectureEvent();

  @override
  Widget build(BuildContext context) {
    final events = FilterBlockUser.filterBlockUserFromEventDtos(context,
        context.select((HomePrefectureState value) => value.eventDtos));

    return Column(
      children: <Widget>[
        CommonHeadLineAndRefresh(
          text: '注目地域イベント',
          onTap: () => context.read<HomePrefectureState>().isLoading
              ? null
              : _onTap(context),
          loading:
              context.select((HomePrefectureState value) => value.isLoading),
        ),
        !context.select((HomePrefectureState value) => value.init)
            ? const SizedBox.shrink()
            : events == null || events.isEmpty
                ? const Center(
                    child: Text('おすすめイベントはまだありません。'),
                  )
                : EventHorizonList(
                    events: events,
                    eventEditPop: EventEditPop.homePrefecture,
                  ),
      ],
    );
  }

  Future<void> _onTap(BuildContext context) async {
    await context.read<HomePrefectureStateNotifier>().getEventsByPrefecture();
  }
}
