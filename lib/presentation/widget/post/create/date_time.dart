import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/share/validate.dart';
import 'package:kokuchi_event/presentation/widget/common/date_time_since_now.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:provider/provider.dart';

class PostDateTime extends StatelessWidget {
  const PostDateTime();

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        flex: 4,
        child: CommonDateTimeSinceNow(
          initialValue:
              context.select((MyEventEditState value) => value.startDate),
          onChanged: (val) => _startChange(context, val),
          validator: Validate.eventStartDate,
          dateTimeCheck: _startDateCheck,
          hintText: '開始日時',
        ),
      ),
      const Expanded(
          flex: 1,
          child: Text(
            '〜',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11),
          )),
      Expanded(
        flex: 4,
        child: CommonDateTimeSinceNow(
          initialValue:
              context.select((MyEventEditState value) => value.endDate),
          onChanged: (val) => _endChange(context, val),
          validator: Validate.eventEndDate,
          dateTimeCheck: _endDateCheck,
          hintText: '終了日時',
        ),
      ),
    ]);
  }

  void _startChange(BuildContext context, DateTime val) {
    context.read<MyEventEditStateNotifier>().changeStartDate(val);
  }

  void _endChange(BuildContext context, DateTime val) {
    context.read<MyEventEditStateNotifier>().changeEndDate(val);
  }

  bool _startDateCheck(BuildContext context, DateTime val) {
    final endDate = context.read<MyEventEditState>().endDate;
    if ((endDate != null && endDate.isBefore(val)) ||
        (endDate != null && endDate == val)) {
      commonToast(msg: '終了日時より前に設定してください');
      return false;
    }

    return true;
  }

  bool _endDateCheck(BuildContext context, DateTime val) {
    final startDate = context.read<MyEventEditState>().startDate;
    if ((startDate != null && startDate.isAfter(val)) ||
        (startDate != null && startDate == val)) {
      commonToast(msg: '開催日時より後に設定してください');
      return false;
    }
    return true;
  }
}
