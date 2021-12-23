import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/contents_headline.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/finish_text.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/info/date.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/info/join_url.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/info/official_url.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/info/tool.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/info/venue.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/neumo_headline.dart';
import 'package:provider/provider.dart';

class EventDetailInfoNeumo extends StatelessWidget {
  const EventDetailInfoNeumo();

  @override
  Widget build(BuildContext context) {
    final online = context.select((EventDetailState value) => value.online);
    final tool = context.select((EventDetailState value) => value.tool);
    final joinUrl = context.select((EventDetailState value) => value.joinUrl);
    final officialUrl =
        context.select((EventDetailState value) => value.officialPageUrl);
    final isFinished = _isFinishedEvent(context);

    return Neumorphic(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      child: Column(
        children: <Widget>[
          const EventDetailNeumoHeadline(text: '- Infomation -'),
          const SizedBox(height: 25),
          if (isFinished) const EventDetailFinishText(),
          const EventDetailContentsHeadline(text: '開催期間'),
          const EventDetailDate(),
          if (!online)
            Column(children: const <Widget>[
              SizedBox(height: 30),
              EventDetailContentsHeadline(text: '開催住所'),
              EventDetailVenue(),
            ]),
          if (officialUrl != null && officialUrl.isNotEmpty)
            Column(children: const <Widget>[
              SizedBox(height: 30),
              EventDetailContentsHeadline(text: 'オフィシャルページURL'),
              EventDetailOfficialUrl(),
            ]),
          if (online && (tool != null && tool.isNotEmpty))
            Column(children: const <Widget>[
              SizedBox(height: 30),
              EventDetailContentsHeadline(text: '使用ツール'),
              EventDetailTool(),
            ]),
          if (online && (joinUrl != null && joinUrl.isNotEmpty))
            Column(children: const <Widget>[
              SizedBox(height: 30),
              EventDetailContentsHeadline(text: '参加URL'),
              EventDetailJoinUrl(),
            ]),
        ],
      ),
    );
  }

  bool _isFinishedEvent(BuildContext context) {
    final endDate = context.select((EventDetailState value) => value.endDate);
    if (DateTime.now().isAfter(endDate)) {
      return true;
    }
    return false;
  }
}
