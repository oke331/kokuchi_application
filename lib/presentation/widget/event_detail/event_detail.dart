import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:kokuchi_event/application/dto/event/event_dto.dart';
import 'package:kokuchi_event/application/user_app_service.dart';
import 'package:kokuchi_event/domain/user/user_repository_base.dart';
import 'package:kokuchi_event/infrastructure/user/user_factory.dart';
import 'package:kokuchi_event/presentation/notifier/block_user/block_user_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/event/event_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/lets_go/lets_go_state.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/share/filter_block_user.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/block_event.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/body.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class EventDetail extends StatelessWidget {
  const EventDetail({@required EventDto eventDto}) : _eventDto = eventDto;

  final EventDto _eventDto;
  @override
  Widget build(BuildContext context) {
    final userId = context.select((UserState value) => value.id);

    // ブロックしているイベントかチェック
    final otherId = _eventDto.author.id;
    final isBlockedUser =
        context.select((BlockUserState value) => value.isBlockedUsersDto);
    final blockUser =
        context.select((BlockUserState value) => value.blockUsersDto);
    if (FilterBlockUser.checkNGBlockBeforeEventDetailShow(
        blockUser: blockUser,
        isBlockedUser: isBlockedUser,
        userId: otherId,
        showToast: false)) {
      return const EventDetailBlockEvent();
    }

    return MultiProvider(
      providers: [
        StateNotifierProvider<EventDetailStateNotifier, EventDetailState>(
          create: (_) => _eventDto.author.id == userId
              ? EventDetailStateNotifier.fromMyEventDto(
                  eventDto: _eventDto,
                  app: UserAppService(
                    factory: const UserFactory(),
                    repository: context.read<UserRepositoryBase>(),
                  ),
                )
              : EventDetailStateNotifier.fromEventDto(
                  eventDto: _eventDto,
                  app: UserAppService(
                    factory: const UserFactory(),
                    repository: context.read<UserRepositoryBase>(),
                  ),
                ),
        ),
      ],
      child: Builder(
        builder: (context) {
          return WillPopScope(
            onWillPop: () async =>
                !(context.read<EventDetailState>().isLoading ||
                    context.read<EventState>().isLoading ||
                    context.read<LetsGoState>().isLoadingChangeLetsGo),
            child: ModalProgressHUD(
              progressIndicator: const CenterLoading(),
              child: const Scaffold(
                body: EventDetailBody(),
              ),
              inAsyncCall:
                  context.select((EventDetailState value) => value.isLoading) ||
                      context.select((EventState value) => value.isLoading),
            ),
          );
        },
      ),
    );
  }
}
