import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:http/http.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/common/user_report_type.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/block_user/block_user_state.dart';
import 'package:kokuchi_event/presentation/notifier/user/other_user_card/other_user_card_state.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/share/network_check.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/common/report/awesome_dialog_button.dart';
import 'package:kokuchi_event/presentation/widget/common/report/report_button.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:provider/provider.dart';

class OtherUserPageReport extends StatelessWidget {
  const OtherUserPageReport();

  static const slackToken = '';
  static const channelName = 'kokuchi_user_report_channel';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: IconButton(
        icon: const Icon(Icons.report_problem),
        alignment: Alignment.centerLeft,
        color: Colors.red[300],
        iconSize: 20,
        onPressed: () => _onPressed(context),
      ),
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    final isLoading = context.read<OtherUserCardState>().isLoading;
    final userId = context.read<OtherUserCardState>().userDto.id;
    final blockUsers = context.read<BlockUserState>().blockUsersDto;
    var checkContainBlockUser = false;
    if (blockUsers != null && blockUsers.isNotEmpty) {
      checkContainBlockUser = blockUsers.map((e) => e.id).contains(userId);
    }

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
        btnCancelColor: Colors.grey,
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                const Text('通報', style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                const Text(
                  '通報する内容を選んでください。\n\n※相手に通報の内容は通知されません。',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 15),
                ReportButton(
                  text: UserReportType.image,
                  function: () =>
                      isLoading ? null : _report(context, UserReportType.image),
                ),
                ReportButton(
                  text: UserReportType.text,
                  function: () =>
                      isLoading ? null : _report(context, UserReportType.text),
                ),
                ReportButton(
                  text: UserReportType.post,
                  function: () =>
                      isLoading ? null : _report(context, UserReportType.post),
                ),
                ReportButton(
                  text: UserReportType.spam,
                  function: () =>
                      isLoading ? null : _report(context, UserReportType.spam),
                ),
                if (!checkContainBlockUser)
                  Column(
                    children: [
                      const SizedBox(height: 35),
                      const Text('ユーザーブロック', style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 10),
                      const Text(
                        'ブロックするとお互いの投稿が表示されなくなります。\n\n※相手に通知はされません。',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13),
                      ),
                      const SizedBox(height: 18),
                      AwesomeDialogButton(
                        text: 'ブロックする',
                        function: () => _block(context),
                        color: Colors.pink,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
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
      context.read<OtherUserCardStateNotfier>().changeIsLoading(val: true);
      Navigator.pop(context);
      await context.read<OtherUserCardStateNotfier>().reportUser(content);
      final me = context.read<UserState>();
      final otherUser = context.read<OtherUserCardState>().userDto;
      final req = Request(
          'POST',
          Uri.https('slack.com', '/api/chat.postMessage', {
            'token': slackToken,
            'channel': channelName,
            'text':
                'ーーーーーーユーザーの通報ーーーーーー\n報告をしたユーザー：${me.name}　(${me.id})\n通報されたユーザー：${otherUser.name}　(${otherUser.id})\n内容：$content',
          }));
      await req.send();
      await commonToast(msg: '通報しました');
    } on Exception catch (e, s) {
      logger.d(e);
      await commonToast(msg: '通報に失敗しました。申し訳ありません。');
      await FirebaseCrashlytics.instance.recordError(e, s);
      return;
    } finally {
      context.read<OtherUserCardStateNotfier>().changeIsLoading(val: false);
    }
  }

  Future<void> _block(BuildContext context) async {
    // インターネット接続をチェック
    if (!await NetworkCheck.isConnect()) {
      await commonToast(msg: CommonString.noNetworkError);
      return;
    }

    Navigator.pop(context);
    final otherUser = context.read<OtherUserCardState>().userDto;
    await context
        .read<BlockUserStateNotifier>()
        .addBlockUser(otherId: otherUser.id);
  }
}
