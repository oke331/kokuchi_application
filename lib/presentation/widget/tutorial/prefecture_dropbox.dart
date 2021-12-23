import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/prefecture_data.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/widget/common/dropdown.dart';
import 'package:provider/provider.dart';

class TutorialPrefectureDropbox extends StatelessWidget {
  const TutorialPrefectureDropbox();

  @override
  Widget build(BuildContext context) {
    return CommonDropdown(
      selectItem: context.select((UserState value) => value.prefecture),
      itemList: prefectureData,
      onChanged: (value) =>
          context.read<UserStateNotifier>().changePrefecture(value),
    );
  }
}
