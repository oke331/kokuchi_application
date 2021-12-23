import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/user/my_page_edit/my_page_edit_state.dart';
import 'package:kokuchi_event/presentation/share/validate.dart';
import 'package:kokuchi_event/presentation/widget/common/text_field.dart';
import 'package:provider/provider.dart';

class MyPageEditName extends StatelessWidget {
  const MyPageEditName();

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
        initialValue: context.select((MyPageEditState value) => value.name),
        onChanged: (value) =>
            context.read<MyPageEditStateNotifier>().changeName(value),
        maxLength: 20,
        validator: Validate.userName);
  }
}
