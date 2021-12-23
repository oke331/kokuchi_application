import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/presentation/notifier/event/event/event_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/common/report/awesome_dialog_button.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:kokuchi_event/restart_widget.dart';
import 'package:provider/provider.dart';

class EventDetailRemove extends StatelessWidget {
  const EventDetailRemove();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 3;

    return NeumorphicButton(
      margin: EdgeInsets.symmetric(horizontal: width, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '削除',
            style: TextStyle(color: Colors.red[300]),
          ),
          Icon(
            Icons.delete,
            color: Colors.red[300],
          ),
        ],
      ),
      onPressed: () => _onPressed(context),
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    final isLoading = context.read<EventState>().isLoading;

    await AwesomeDialog(
            context: context,
            headerAnimationLoop: false,
            customHeader: NeumorphicIcon(
              Icons.error,
              size: 100,
              style: NeumorphicStyle(color: Colors.red[300], depth: 10),
            ),
            animType: AnimType.BOTTOMSLIDE,
            title: 'Warning!',
            desc:
                '本当に削除してよろしいですか？\n削除後はこのイベントの編集や閲覧はできなくなります。\n\n削除後はホーム画面に戻ります。\n\n※削除には時間がかかることがあります。',
            btnCancel: AwesomeDialogButton(
              function: isLoading ? null : () => Navigator.pop(context),
              text: 'キャンセル',
              color: Colors.grey,
              textColor: Colors.white,
            ),
            btnOk: AwesomeDialogButton(
              function: isLoading ? null : () async => _remove(context),
              text: 'OK',
              color: Colors.red[300],
              textColor: Colors.white,
            ),
            dismissOnTouchOutside: !isLoading,
            body: isLoading
                ? Stack(
                    children: const [
                      Align(
                        alignment: Alignment.center,
                        child: CenterLoading(),
                      )
                    ],
                  )
                : null)
        .show();
  }

  Future<void> _remove(BuildContext context) async {
    try {
      final eventDetailState = context.read<EventDetailState>();
      Navigator.pop(context);
      await context.read<EventStateNotifier>().remove(eventDetailState);
      await commonToast(msg: 'イベントを削除しました。');
      RestartWidget.restartApp(context);
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    }
  }
}
