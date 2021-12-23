import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/share/validate.dart';
import 'package:kokuchi_event/presentation/widget/common/text_field.dart';
import 'package:provider/provider.dart';

class PostOfficialPageUrl extends StatelessWidget {
  const PostOfficialPageUrl();

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      initialValue:
          context.select((MyEventEditState value) => value.officialPageUrl),
      maxLength: 10000,
      hintText: '例：https://oke.com',
      onChanged: (val) => _onChanged(context, val),
      validator: Validate.eventOfficialPageUrl,
      keyboardType: TextInputType.url,
    );
  }

  void _onChanged(BuildContext context, String val) {
    context.read<MyEventEditStateNotifier>().changeOfficialPageUrl(val);
  }
}
