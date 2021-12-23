import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/new_event/new_event_state.dart';
import 'package:kokuchi_event/presentation/share/filter_block_user.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/event_list/card.dart';
import 'package:kokuchi_event/presentation/widget/event_list/list/vertical_list.dart';
import 'package:provider/provider.dart';

class HomeNewEventList extends StatelessWidget {
  const HomeNewEventList();

  @override
  Widget build(BuildContext context) {
    final events = FilterBlockUser.filterBlockUserFromEventDtos(
        context, context.select((NewEventState value) => value.events));

    return Column(
      children: <Widget>[
        !context.select((NewEventState value) => value.init)
            ? const SizedBox.shrink()
            : events == null || events.isEmpty
                ? const Center(
                    child: Text('新着イベントはありません。'),
                  )
                : Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      EventVerticalList(
                        events: events,
                        eventEditPop: EventEditPop.homeNew,
                      ),
                      context.select((NewEventState value) => value.isLoading)
                          ? const Positioned(
                              bottom: 40,
                              child: CenterLoading(),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
        const SizedBox(height: 20),
      ],
    );
  }
}
