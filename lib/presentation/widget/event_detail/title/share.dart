import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/share/datetime_and_weekday.dart';
import 'package:kokuchi_event/presentation/share/network_check.dart';
import 'package:kokuchi_event/presentation/share/sns_share_dynamic_link.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:kokuchi_event/run.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class EventDetailShare extends StatelessWidget {
  const EventDetailShare();

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.circle,
      color: Colors.transparent,
      child: InkWell(
        child: NeumorphicIcon(
          Icons.share,
          style: const NeumorphicStyle(color: Colors.blue),
        ),
        onTap: () => _onTap(context),
      ),
    );
  }

  Future<void> _onTap(BuildContext context) async {
    if (!await NetworkCheck.isConnect()) {
      await commonToast(msg: CommonString.noNetworkError);
      return;
    }
    final eventId = context.read<EventDetailState>().id;
    final title = context.read<EventDetailState>().title;
    final startDateDateTime = context.read<EventDetailState>().startDate;
    final endDateDateTime = context.read<EventDetailState>().endDate;

    final val = dateTimeAndWeekDay(startDateDateTime, endDateDateTime);

    final flavor = context.read<Flavor>();

    final linkUrl =
        await SnsShareDynamicLink.shortUriFromEventId(eventId, flavor);

    await Share.share('＜Kokuchi イベント情報＞\n'
        '- タイトル - \n$title\n\n'
        '- 開催期間 -\n$val\n\n'
        '$linkUrl');
  }
}
