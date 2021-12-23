import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:kokuchi_event/application/event_app_service.dart';
import 'package:kokuchi_event/domain/event/event_repository_base.dart';
import 'package:kokuchi_event/infrastructure/event/event_factory.dart';
import 'package:kokuchi_event/presentation/notifier/event/lets_go/lets_go_state.dart';
import 'package:kokuchi_event/presentation/notifier/search_result_state/search_result_state.dart';
import 'package:kokuchi_event/presentation/widget/search_result/body.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatelessWidget {
  const SearchResult();

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<SearchResultStateNotifier, SearchResultState>(
      create: (context) => SearchResultStateNotifier(
          app: EventAppService(
        factory: const EventFactory(),
        repository: context.read<EventRepositoryBase>(),
      )),
      child: WillPopScope(
        onWillPop: () async => _willPop(context),
        child: Scaffold(
          body: SearchResultBody(),
        ),
      ),
    );
  }

  Future<bool> _willPop(BuildContext context) async {
    // いきたい中は画面が戻らないよう変更
    final letsGoIsLoading = context.read<LetsGoState>().isLoadingChangeLetsGo;
    return !letsGoIsLoading;
  }
}
