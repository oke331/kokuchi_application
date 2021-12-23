import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/widget/common/neumo_checkbox.dart';
import 'package:provider/provider.dart';

class TutorialCheckbox extends StatelessWidget {
  const TutorialCheckbox();

  @override
  Widget build(BuildContext context) {
    return NeumoCheckbox(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      onPressed: () => _onPressed(context),
      boolState: context.select((UserState value) => value.prefectureStatus),
    );
  }

  void _onPressed(BuildContext context) {
    context.read<UserStateNotifier>().togglePrefectureStatus();
  }
}
