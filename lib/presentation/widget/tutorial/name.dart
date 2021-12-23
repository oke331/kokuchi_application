import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/share/validate.dart';
import 'package:kokuchi_event/presentation/widget/common/text_field.dart';
import 'package:provider/provider.dart';

class TutorialName extends StatelessWidget {
  const TutorialName();

  @override
  Widget build(BuildContext context) {
    return CommonTextField(
        onChanged: (value) =>
            context.read<UserStateNotifier>().changeName(value),
        maxLength: 20,
        validator: Validate.userName);
  }
}
