import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/share/validate.dart';
import 'package:provider/provider.dart';

class PostText extends StatelessWidget {
  const PostText();

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.only(left: 10, right: 10),
      style: const NeumorphicStyle(
        depth: -5,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: TextFormField(
        initialValue: context.select((MyEventEditState value) => value.text),
        onChanged: (val) => _onChanged(context, val),
        minLines: 5,
        maxLength: 500,
        decoration: const InputDecoration.collapsed(hintText: null),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        validator: Validate.eventText,
      ),
    );
  }

  void _onChanged(BuildContext context, String val) {
    context.read<MyEventEditStateNotifier>().changeText(val);
  }
}
