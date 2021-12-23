import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/share/validate.dart';
import 'package:kokuchi_event/presentation/widget/common/text_field.dart';
import 'package:provider/provider.dart';

class PostVenue extends StatelessWidget {
  const PostVenue();

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      initialValue: context.select((MyEventEditState value) => value.venue),
      maxLength: 100,
      hintText: '例：東京都渋谷区道玄坂２丁目１',
      onChanged: (val) => _onChanged(context, val),
      validator: Validate.eventVenue,
    );
  }

  void _onChanged(BuildContext context, String val) {
    context.read<MyEventEditStateNotifier>().changeVenue(val);
  }
}
