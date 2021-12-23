import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:kokuchi_event/application/dto/user_dto.dart';
import 'package:kokuchi_event/application/event_app_service.dart';
import 'package:kokuchi_event/application/user_report_app_service.dart';
import 'package:kokuchi_event/domain/event/event_repository_base.dart';
import 'package:kokuchi_event/domain/user_report/user_report_repository_base.dart';
import 'package:kokuchi_event/infrastructure/event/event_factory.dart';
import 'package:kokuchi_event/infrastructure/user_report/user_report_factory.dart';
import 'package:kokuchi_event/presentation/notifier/block_user/block_user_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/lets_go/lets_go_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/user_event_show/user_event_show_state.dart';
import 'package:kokuchi_event/presentation/notifier/user/other_user_card/other_user_card_state.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/other_user_page/body.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class OtherUserPage extends StatelessWidget {
  const OtherUserPage({@required UserDto userDto}) : _userDto = userDto;

  final UserDto _userDto;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<UserEventShowStateNotifier, UserEventShowState>(
          create: (context) => UserEventShowStateNotifier(
            userId: _userDto.id,
            app: EventAppService(
              factory: const EventFactory(),
              repository: context.read<EventRepositoryBase>(),
            ),
          ),
        ),
        StateNotifierProvider<OtherUserCardStateNotfier, OtherUserCardState>(
          create: (_) => OtherUserCardStateNotfier(
            userDto: _userDto,
            reportApp: UserReportAppService(
                reportFactory: const UserReportFactory(),
                reporrtRepository: context.read<UserReportRepositoryBase>()),
          ),
        ),
      ],
      child: Builder(
        builder: (context) {
          return WillPopScope(
            onWillPop: () async =>
                !(context.read<OtherUserCardState>().isLoading ||
                    context.read<BlockUserState>().isLoading ||
                    context.read<LetsGoState>().isLoadingChangeLetsGo),
            child: ModalProgressHUD(
              progressIndicator: const CenterLoading(),
              inAsyncCall: context
                      .select((OtherUserCardState value) => value.isLoading) ||
                  context.select((BlockUserState value) => value.isLoading),
              child: Scaffold(
                backgroundColor: NeumorphicTheme.baseColor(context),
                body: OtherUserPageBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}
