import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';

class CommonDateTimeSinceNow extends StatelessWidget {
  CommonDateTimeSinceNow(
      {@required void Function(DateTime) onChanged,
      @required String Function(DateTime) validator,
      @required bool Function(BuildContext, DateTime) dateTimeCheck,
      @required String hintText,
      DateTime initialValue})
      : _onChanged = onChanged,
        _validator = validator,
        _dateTimeCheck = dateTimeCheck,
        _hintText = hintText,
        _initialValue = initialValue;

  final void Function(DateTime) _onChanged;
  final String Function(DateTime) _validator;
  final bool Function(BuildContext, DateTime) _dateTimeCheck;
  final String _hintText;
  final DateTime _initialValue;

  final _format = DateFormat('yyyy/MM/dd\nHH:mm');

  static const _cancelString = 'キャンセル';
  static const _okString = 'OK';

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      initialValue: _initialValue,
      decoration: InputDecoration(
        hintText: _hintText,
      ),
      resetIcon: const Icon(
        Icons.close,
        size: 15,
      ),
      validator: _validator,
      onChanged: _onChanged,
      style: const TextStyle(fontSize: 13, color: Colors.black),
      format: _format,
      onShowPicker: (context, currentValue) async {
        final date = await showDatePicker(
            cancelText: _cancelString,
            confirmText: _okString,
            context: context,
            firstDate: DateTime(DateTime.now().year),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
        if (date != null) {
          final time = await showTimePicker(
            cancelText: _cancelString,
            confirmText: _okString,
            context: context,
            initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
          );

          final dateTime = DateTimeField.combine(date, time);
          if (_dateTimeCheck(context, dateTime)) {
            return dateTime;
          }

          return currentValue;
        } else {
          return currentValue;
        }
      },
    );
  }
}
