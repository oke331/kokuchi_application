import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:http/http.dart';
import 'package:kokuchi_event/common/event_report_type.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/event/event/event_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/share/network_check.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/common/report/awesome_dialog_button.dart';
import 'package:kokuchi_event/presentation/widget/common/report/report_button.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:provider/provider.dart';

class EventDetailReport extends StatelessWidget {
  const EventDetailReport();

  static const slackToken = '';
  static const channelName = 'kokuchi_user_report_channel';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 3;

    return NeumorphicButton(
      margin: EdgeInsets.symmetric(horizontal: width, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '通報',
            style: TextStyle(color: Colors.red[300], fontSize: 13),
          ),
          Icon(
            Icons.report_problem,
            color: Colors.red[300],
            size: 18,
          ),
        ],
      ),
      onPressed: () => _onPressed(context),
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    final isLoading = context.read<EventState>().isLoading;

    await AwesomeDialog(
        dismissOnTouchOutside: !isLoading,
        context: context,
        headerAnimationLoop: false,
        customHeader: NeumorphicIcon(
          Icons.error,
          size: 100,
          style: NeumorphicStyle(color: Colors.red[300], depth: 10),
        ),
        animType: AnimType.BOTTOMSLIDE,
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                const Text(
                  '通報',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                const Text(
                  '通報する内容を選んでください。\n\n※相手に通報の内容は通知されません。',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 20),
                ReportButton(
                  text: EventReportType.image,
                  function: () => isLoading
                      ? null
                      : _report(context, EventReportType.image),
                ),
                ReportButton(
                  text: EventReportType.text,
                  function: () =>
                      isLoading ? null : _report(context, EventReportType.text),
                ),
                ReportButton(
                  text: EventReportType.spam,
                  function: () =>
                      isLoading ? null : _report(context, EventReportType.spam),
                )
              ],
            ),
            isLoading ? const CenterLoading() : const SizedBox.shrink(),
          ],
        ),
        btnCancel: AwesomeDialogButton(
          text: 'キャンセル',
          function: () => Navigator.pop(context),
        )).show();
  }

  Future<void> _report(BuildContext context, String content) async {
    // インターネット接続をチェック
    if (!await NetworkCheck.isConnect()) {
      await commonToast(msg: CommonString.noNetworkError);
      return;
    }

    try {
      context.read<EventStateNotifier>().loadingChange(val: true);
      Navigator.pop(context);
      final event = context.read<EventDetailState>();
      await context.read<EventStateNotifier>().reportEvent(
          eventId: event.id, content: content, otherId: event.author.id);

      final me = context.read<UserState>();
      final otherUserName = event.userDto.name;
      final req = Request(
          'POST',
          Uri.https('slack.com', '/api/chat.postMessage', {
            'token': slackToken,
            'channel': channelName,
            'text':
                'ーーーーーーイベントの通報ーーーーーー\n報告をしたユーザー：${me.name}　(${me.id})\n通報されたイベント：${event.title}　(${event.id})\n通報されたユーザー：$otherUserName　(${event.author.id})\n内容：$content',
          }));
      await req.send();
      await commonToast(msg: '通報しました');
    } on Exception catch (e, s) {
      logger.d(e);
      await commonToast(msg: '通報に失敗しました。申し訳ありません。');
      await FirebaseCrashlytics.instance.recordError(e, s);
      return;
    } finally {
      context.read<EventStateNotifier>().loadingChange(val: false);
    }
  }
}
