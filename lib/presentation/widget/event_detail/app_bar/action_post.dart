import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_confirm/my_event_confirm_state.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:provider/provider.dart';

class EventDetailActionPost extends StatelessWidget {
  const EventDetailActionPost();

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: const NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(), depth: 3),
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      onPressed: () => context.read<MyEventConfirmState>().isLoading
          ? null
          : _onPressed(context),
      child: const Icon(Icons.send),
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    try {
      context.read<MyEventConfirmStateNotifier>().changeLoading(val: true);
      await context.read<MyEventEditStateNotifier>().save();
      context.read<MyEventConfirmStateNotifier>().changeLoading(val: false);

      await commonToast(msg: '投稿が完了しました！');
      final isMyEventEdit = context.read<EventDetailState>().isMyEventEdit;
      if (!isMyEventEdit) {
        // createから来たため、１度だけpop
        Navigator.pop(context);
      } else {
        // editから来たため、3回pop
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.pop(context, true);
      }
    } on GenericException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
      context.read<MyEventConfirmStateNotifier>().changeLoading(val: false);
    } on Exception catch (e, s) {
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);

      logger.d(e.toString());
      context.read<MyEventConfirmStateNotifier>().changeLoading(val: false);
    }
  }
}
