import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/share/validate.dart';
import 'package:kokuchi_event/presentation/widget/common/text_field.dart';
import 'package:provider/provider.dart';

class PostPhoneNumber extends StatelessWidget {
  const PostPhoneNumber();

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
      keyboardType: TextInputType.phone,
      initialValue:
          context.select((MyEventEditState value) => value.phoneNumber),
      maxLength: 15,
      hintText: '例：08012345678',
      onChanged: (val) => _onChanged(context, val),
      validator: Validate.eventPhoneNumber,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
    );
  }

  void _onChanged(BuildContext context, String val) {
    context.read<MyEventEditStateNotifier>().changePhoneNumber(val);
  }
}
