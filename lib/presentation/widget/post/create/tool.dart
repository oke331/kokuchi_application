import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/share/validate.dart';
import 'package:kokuchi_event/presentation/widget/common/text_field.dart';
import 'package:provider/provider.dart';

class PostTool extends StatelessWidget {
  const PostTool();

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      initialValue: context.select((MyEventEditState value) => value.tool),
      maxLength: 50,
      hintText: '例：zoom',
      onChanged: (val) => _onChanged(context, val),
      validator: Validate.eventTool,
    );
  }

  void _onChanged(BuildContext context, String val) {
    context.read<MyEventEditStateNotifier>().changeTool(val);
  }
}
