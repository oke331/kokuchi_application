import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/user/my_page_edit/my_page_edit_state.dart';
import 'package:kokuchi_event/presentation/share/validate.dart';
import 'package:provider/provider.dart';

class MyPageEditText extends StatelessWidget {
  const MyPageEditText();

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.only(left: 10, right: 10),
      style: const NeumorphicStyle(
        depth: -5,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: TextFormField(
        initialValue: context.select((MyPageEditState value) => value.text),
        onChanged: (value) =>
            context.read<MyPageEditStateNotifier>().changeText(value),
        controller: null,
        validator: Validate.userText,
        minLines: 5,
        maxLength: 100,
        decoration: const InputDecoration.collapsed(hintText: null),
        keyboardType: TextInputType.multiline,
        maxLines: null,
      ),
    );
  }
}
