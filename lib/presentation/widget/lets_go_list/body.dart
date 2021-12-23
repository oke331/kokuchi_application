import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:kokuchi_event/common/color.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/presentation/notifier/event/lets_go/lets_go_state.dart';
import 'package:kokuchi_event/presentation/notifier/setting/setting_state.dart';
import 'package:kokuchi_event/presentation/share/filter_block_user.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:kokuchi_event/presentation/widget/event_list/card.dart';
import 'package:kokuchi_event/presentation/widget/event_list/list/vertical_list.dart';
import 'package:provider/provider.dart';

class LetsGoListBody extends StatelessWidget {
  const LetsGoListBody();

  static ScrollController letsGoScrollController;

  @override
  Widget build(BuildContext context) {
    letsGoScrollController = ScrollController();

    letsGoScrollController.addListener(() async {
      await _scrollListener(context);
    });

    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CustomScrollView(
            controller: letsGoScrollController,
            slivers: <Widget>[
              _letsGoEventList(context),
            ],
          ),
          context.select((LetsGoState value) => value.isLoading)
              ? const Positioned(
                  bottom: 40,
                  child: CenterLoading(),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _letsGoEventList(BuildContext context) {
    final events = FilterBlockUser.filterBlockUserFromEventDtos(
        context, context.select((LetsGoState value) => value.letsGosEventDto));

    return SliverStickyHeader(
      header: Container(
        color: CommonColor.backLightColor,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'いきたい！ リスト',
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headline6.fontSize),
              textAlign: TextAlign.left,
            ),
            const SizedBox(width: 2),
            context.select((LetsGoState value) => value.isLoading
                ? const Icon(
                    Icons.refresh,
                    color: Colors.green,
                  )
                : InkWell(
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.grey,
                    ),
                    onTap: () => context.read<LetsGoState>().isLoading
                        ? null
                        : _onRefreshTap(context),
                  )),
            const SizedBox(height: 10),
          ],
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          <Widget>[
            !context.select((LetsGoState value) => value.init)
                ? const SizedBox.shrink()
                : events == null || events.isEmpty
                    ? Column(
                        children: const [
                          SizedBox(height: 20),
                          Center(
                            child: Text('「いきたい」を押したイベントが表示されます。'),
                          ),
                        ],
                      )
                    : EventVerticalList(
                        events: events,
                        eventEditPop: EventEditPop.letsGo,
                      ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _onRefreshTap(BuildContext context) async {
    try {
      await context.read<LetsGoStateNotifier>().refresh();

      // リマインダーの通知がONのときだけ再度登録する
      await context.read<SettingStateNotifier>().reloadLetsGos();
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    }
  }

  Future<void> _scrollListener(BuildContext context) async {
    if (letsGoScrollController.offset >=
            letsGoScrollController.position.maxScrollExtent &&
        !letsGoScrollController.position.outOfRange) {
      await context.read<LetsGoStateNotifier>().fetch();
    }
  }
}
