import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/user/my_page_edit/my_page_edit_state.dart';
import 'package:kokuchi_event/presentation/widget/common/neumo_checkbox.dart';
import 'package:provider/provider.dart';

class MyPageEditStatusCheck extends StatelessWidget {
  const MyPageEditStatusCheck();

  @override
  Widget build(BuildContext context) {
    return NeumoCheckbox(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      onPressed: () =>
          context.read<MyPageEditStateNotifier>().togglePrefectureStatus(),
      boolState:
          context.select((MyPageEditState value) => value.prefectureStatus),
    );
  }
}
