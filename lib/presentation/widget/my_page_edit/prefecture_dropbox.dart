import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/prefecture_data.dart';
import 'package:kokuchi_event/presentation/notifier/user/my_page_edit/my_page_edit_state.dart';
import 'package:kokuchi_event/presentation/widget/common/dropdown.dart';
import 'package:provider/provider.dart';

class MyPageEditPrefectureDropbox extends StatelessWidget {
  const MyPageEditPrefectureDropbox();

  @override
  Widget build(BuildContext context) {
    return CommonDropdown(
      selectItem: context.select((MyPageEditState value) => value.prefecture),
      itemList: prefectureData,
      onChanged: (value) =>
          context.read<MyPageEditStateNotifier>().changePrefecture(value),
    );
  }
}
