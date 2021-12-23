import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/lets_go/lets_go_state.dart';
import 'package:kokuchi_event/presentation/notifier/setting/setting_state.dart';
import 'package:kokuchi_event/presentation/share/network_check.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:provider/provider.dart';

class EventDetailLetsGo extends StatelessWidget {
  const EventDetailLetsGo();

  @override
  Widget build(BuildContext context) {
    final letsGoEventIDs =
        context.select((LetsGoState value) => value.letsGoEventIDs);
    final isLoadingChangeLetsGo =
        context.select((LetsGoState value) => value.isLoadingChangeLetsGo);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'いきたい！',
          style: TextStyle(fontSize: 13),
        ),
        Material(
          type: MaterialType.circle,
          color: Colors.transparent,
          child: _isLetsGo(context, letsGoEventIDs)
              ? InkWell(
                  customBorder: const CircleBorder(),
                  child: NeumorphicIcon(
                    Icons.directions_run,
                    style: const NeumorphicStyle(color: Colors.green),
                  ),
                  onTap: isLoadingChangeLetsGo
                      ? null
                      : () => _onTapDelete(context),
                )
              : InkWell(
                  customBorder: const CircleBorder(),
                  child: NeumorphicIcon(
                    Icons.directions_run,
                    style: const NeumorphicStyle(color: Colors.grey),
                  ),
                  onTap: isLoadingChangeLetsGo
                      ? () => null
                      : () => _onTapAdd(context),
                ),
        ),
        Text(context
            .select((EventDetailState value) => value.letsGoCount)
            .toString()),
      ],
    );
  }

  bool _isLetsGo(BuildContext context, List<String> letsGoEventIDs) {
    final eventId = context.select((EventDetailState value) => value.id);
    var result = false;
    if (letsGoEventIDs == null || letsGoEventIDs.isEmpty) return result;
    for (final letsGoEventId in letsGoEventIDs) {
      if (letsGoEventId == eventId) {
        result = true;
      }
    }
    return result;
  }

  Future<void> _onTapAdd(BuildContext context) async {
    // インターネット接続をチェック
    if (!await NetworkCheck.isConnect()) {
      await commonToast(msg: CommonString.noNetworkError);
      return;
    }
    final eventDetailState = context.read<EventDetailState>();
    final eventDetailStateNotifier = context.read<EventDetailStateNotifier>();
    final letsGoReminder = context.read<SettingState>().letsGoReminder;
    await context.read<LetsGoStateNotifier>().letsGoAddFlowFromEventDetailState(
        eventDetailState: eventDetailState,
        eventDetailStateNotifier: eventDetailStateNotifier,
        letsGoReminder: letsGoReminder);
  }

  Future<void> _onTapDelete(BuildContext context) async {
    // インターネット接続をチェック
    if (!await NetworkCheck.isConnect()) {
      await commonToast(msg: CommonString.noNetworkError);
      return;
    }
    final eventDetailState = context.read<EventDetailState>();
    final eventDetailStateNotifier = context.read<EventDetailStateNotifier>();
    final letsGoReminder = context.read<SettingState>().letsGoReminder;
    await context
        .read<LetsGoStateNotifier>()
        .letsGoDeleteFlowFromEventDetailState(
            eventDetailState: eventDetailState,
            eventDetailStateNotifier: eventDetailStateNotifier,
            letsGoReminder: letsGoReminder);
  }
}
