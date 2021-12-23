import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/contact/user_tile.dart';
import 'package:provider/provider.dart';

class EventDetailUser extends StatelessWidget {
  const EventDetailUser();

  @override
  Widget build(BuildContext context) {
    final eventUserId =
        context.select((EventDetailState value) => value.author)?.id;

    if (!context.select((EventDetailState value) => value.userGetInit)) {
      return const CenterLoading();
    }

    return
        // eventUserIdがnullで新規登録の時か、自分のイベントを編集するときは押せないようにする
        eventUserId == null ||
                context.select((UserState value) => value.id) == eventUserId
            ? EventDetailUserTile(
                name: context.select((UserState value) => value.name),
                iconUrl: context.select((UserState value) => value.iconUrl))
            : InkWell(
                child: EventDetailUserTile(
                    name: context
                        .select((EventDetailState value) => value.userDto)
                        .name,
                    iconUrl: context
                        .select((EventDetailState value) => value.userDto)
                        .iconUrl),
                onTap: () => _onTap(context),
              );
  }

  void _onTap(BuildContext context) {
    final userDto = context.read<EventDetailState>().userDto;
    Navigator.of(context)
        .pushNamed(RouteName.otherUserPage, arguments: userDto);
  }
}
