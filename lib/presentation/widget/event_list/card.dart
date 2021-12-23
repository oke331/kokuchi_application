import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/presentation/notifier/block_user/block_user_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/home_online/home_online_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/home_prefecture/home_prefecture_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/lets_go/lets_go_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/new_event/new_event_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/user_event_show/user_event_show_state.dart';
import 'package:kokuchi_event/presentation/notifier/search_result_state/search_result_state.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';
import 'package:kokuchi_event/presentation/share/filter_block_user.dart';
import 'package:kokuchi_event/presentation/widget/event_list/category.dart';
import 'package:kokuchi_event/presentation/widget/event_list/date.dart';
import 'package:kokuchi_event/presentation/widget/event_list/finish_text.dart';
import 'package:kokuchi_event/presentation/widget/event_list/image.dart';
import 'package:kokuchi_event/presentation/widget/event_list/lets_go.dart';
import 'package:kokuchi_event/presentation/widget/event_list/online.dart';
import 'package:kokuchi_event/presentation/widget/event_list/title.dart';
import 'package:kokuchi_event/presentation/widget/event_list/venue.dart';
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {
  const EventCard(
      {@required EventDto eventDto, @required EventEditPop eventEditPop})
      : _eventEditPop = eventEditPop,
        _eventDto = eventDto;

  final EventDto _eventDto;
  final EventEditPop _eventEditPop;

  static const finishBackColor = Color.fromARGB(13, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EventDto>.value(
        value: _eventDto,
        builder: (context, child) {
          final isFinished = _isFinishedEvent(context);
          return InkWell(
            child: Neumorphic(
              style: isFinished
                  ? const NeumorphicStyle(color: finishBackColor)
                  : null,
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const EventImage(),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        const EventTitle(),
                        Column(
                          children: [
                            const EventCategory(),
                            if (context
                                .select((EventDto value) => value.online))
                              const EventOnline(),
                          ],
                        ),
                        if (!isFinished) const EventDate(),
                        if (isFinished) const EventListFinishText(),
                        if (!context.select((EventDto value) => value.online))
                          const EventVenue(),
                        const EventLetsGo(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            onTap: () => _onTap(context),
          );
        });
  }

  bool _isFinishedEvent(BuildContext context) {
    final endDate = context.select((EventDto value) => value.endDate);
    if (DateTime.now().isAfter(endDate)) {
      return true;
    }
    return false;
  }

  void _onTap(BuildContext context) {
    final eventDto = context.read<EventDto>();

    // ブロックしているイベントかチェック
    final otherId = eventDto.author.id;
    final isBlockedUser = context.read<BlockUserState>().isBlockedUsersDto;
    final blockUser = context.read<BlockUserState>().blockUsersDto;
    if (FilterBlockUser.checkNGBlockBeforeEventDetailShow(
        blockUser: blockUser,
        isBlockedUser: isBlockedUser,
        userId: otherId)) return;

    Navigator.of(context, rootNavigator: true)
        .pushNamed(RouteName.eventDetail, arguments: eventDto)
        .then((value) async {
      if (value != null && value is bool && value) {
        switch (_eventEditPop) {
          case EventEditPop.myPage:
            await context
                .read<UserEventShowStateNotifier>()
                .refreshEvent(eventDto);
            break;
          case EventEditPop.letsGo:
            await context.read<LetsGoStateNotifier>().refresh();
            break;
          case EventEditPop.homeOnline:
            await context.read<HomeOnlineStateNotifier>().getEventsByOnline();
            break;
          case EventEditPop.homePrefecture:
            await context
                .read<HomePrefectureStateNotifier>()
                .getEventsByPrefecture();
            break;
          case EventEditPop.homeNew:
            await context.read<NewEventStateNotifier>().refreshEvent(eventDto);
            break;
          case EventEditPop.searchResult:
            await context
                .read<SearchResultStateNotifier>()
                .refreshEvent(eventDto);
            break;
          default:
        }
      }
    });
  }
}

enum EventEditPop {
  myPage,
  homePrefecture,
  homeOnline,
  homeNew,
  letsGo,
  searchResult,
}
