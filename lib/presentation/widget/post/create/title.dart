import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/share/validate.dart';
import 'package:kokuchi_event/presentation/widget/common/text_field.dart';
import 'package:provider/provider.dart';

class PostTitle extends StatelessWidget {
  const PostTitle();

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      initialValue: context.select((MyEventEditState value) => value.title),
      maxLength: 30,
      onChanged: (val) => _onChanged(context, val),
      validator: Validate.eventTitle,
    );
  }

  void _onChanged(BuildContext context, String val) {
    context.read<MyEventEditStateNotifier>().changeTitle(val);
  }
}
