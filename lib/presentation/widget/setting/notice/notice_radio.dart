import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/setting/setting_state.dart';
import 'package:provider/provider.dart';

class SettingNoticeRadio extends StatelessWidget {
  const SettingNoticeRadio({
    @required bool groupValue,
    @required double radioSize,
  })  : _groupValue = groupValue,
        _radioSize = radioSize;

  final bool _groupValue;
  final double _radioSize;

  @override
  Widget build(BuildContext context) {
    final letsGoBool =
        context.select((SettingState value) => value.letsGoReminder);

    return Row(
      children: <Widget>[
        NeumorphicRadio<bool>(
          groupValue: _groupValue,
          padding: EdgeInsets.all(_radioSize),
          style: NeumorphicRadioStyle(
            selectedColor: letsGoBool ? Colors.green : Colors.white,
            boxShape: const NeumorphicBoxShape.circle(),
          ),
          value: true,
          child: Text(
            'ON',
            style: letsGoBool ? const TextStyle(color: Colors.white) : null,
          ),
          onChanged: (value) => _onONChanged(value, context),
        ),
        NeumorphicRadio<bool>(
          groupValue: _groupValue,
          padding: EdgeInsets.all(_radioSize),
          style: NeumorphicRadioStyle(
            boxShape: const NeumorphicBoxShape.circle(),
            selectedColor: letsGoBool ? Colors.white : Colors.green,
          ),
          value: false,
          child: Text(
            'OFF',
            style: letsGoBool ? null : const TextStyle(color: Colors.white),
          ),
          onChanged: (value) => _onOFFChanged(value, context),
        ),
      ],
    );
  }

  Future<void> _onONChanged(bool val, BuildContext context) async {
    if (context.read<SettingState>().letsGoReminder) return;
    await context.read<SettingStateNotifier>().letsGoReminderON();
  }

  Future<void> _onOFFChanged(bool val, BuildContext context) async {
    if (!context.read<SettingState>().letsGoReminder) return;
    await context.read<SettingStateNotifier>().letsGoReminderOFF();
  }
}
