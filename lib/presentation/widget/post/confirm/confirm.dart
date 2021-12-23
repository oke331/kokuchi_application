import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:kokuchi_event/application/user_app_service.dart';
import 'package:kokuchi_event/domain/user/user_repository_base.dart';
import 'package:kokuchi_event/infrastructure/user/user_factory.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_confirm/my_event_confirm_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/post/confirm/body.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class PostConfirm extends StatelessWidget {
  const PostConfirm(
      {@required MyEventEditState state,
      @required MyEventEditStateNotifier stateNotifier})
      : _state = state,
        _stateNotifier = stateNotifier;

  final MyEventEditState _state;
  final MyEventEditStateNotifier _stateNotifier;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<EventDetailStateNotifier, EventDetailState>(
            create: (_) => _state.isEdit
                ? EventDetailStateNotifier.fromIsEditTrueMyEventEditState(
                    myEventEditState: _state,
                    app: UserAppService(
                      factory: const UserFactory(),
                      repository: context.read<UserRepositoryBase>(),
                    ),
                  )
                : EventDetailStateNotifier.fromMyEventEditState(
                    myEventEditState: _state,
                    app: UserAppService(
                      factory: const UserFactory(),
                      repository: context.read<UserRepositoryBase>(),
                    ),
                  )),
        Provider<MyEventEditStateNotifier>(
          create: (_) => _stateNotifier,
        ),
        StateNotifierProvider<MyEventConfirmStateNotifier, MyEventConfirmState>(
          create: (_) => MyEventConfirmStateNotifier(),
        )
      ],
      child: Builder(
        builder: (context) {
          return WillPopScope(
            onWillPop: () async =>
                !context.read<MyEventConfirmState>().isLoading,
            child: Scaffold(
              body: ModalProgressHUD(
                child: const PostConfirmBody(),
                progressIndicator: const CenterLoading(),
                inAsyncCall: context
                    .select((MyEventConfirmState value) => value.isLoading),
              ),
            ),
          );
        },
      ),
    );
  }
}
