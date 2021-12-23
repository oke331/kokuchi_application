import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/block_user/block_user_state.dart';
import 'package:kokuchi_event/presentation/notifier/user/other_user_card/other_user_card_state.dart';
import 'package:kokuchi_event/presentation/share/filter_block_user.dart';
import 'package:kokuchi_event/presentation/widget/other_user_page/block_user_text.dart';
import 'package:kokuchi_event/presentation/widget/user_page/icon.dart';
import 'package:kokuchi_event/presentation/widget/user_page/name.dart';
import 'package:kokuchi_event/presentation/widget/user_page/prefecture.dart';
import 'package:kokuchi_event/presentation/widget/user_page/text.dart';
import 'package:provider/provider.dart';

class OtherUserPageCard extends StatelessWidget {
  const OtherUserPageCard();

  @override
  Widget build(BuildContext context) {
    final userDto = context.select((OtherUserCardState value) => value.userDto);
    final text = userDto.text;
    final prefectureStatus = userDto.prefectureStatus ?? false;
    final userId = userDto.id;

    final isBlockedUser =
        context.select((BlockUserState value) => value.isBlockedUsersDto);
    final checkIsBlockedUser =
        FilterBlockUser.checkContains(userDto: isBlockedUser, userId: userId);

    final blockUser =
        context.select((BlockUserState value) => value.blockUsersDto);
    final checkBlockUser =
        FilterBlockUser.checkContains(userDto: blockUser, userId: userId);

    return Neumorphic(
      margin: const EdgeInsets.symmetric(horizontal: 75, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          UserPageIcon(userDto.iconUrl),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              UserPageName(userDto.name),
            ],
          ),
          if (prefectureStatus) const SizedBox(height: 10),
          if (prefectureStatus) UserPagePrefecture(userDto.prefecture),
          if (!checkIsBlockedUser &&
              !checkBlockUser &&
              (text != null && text.isNotEmpty))
            const SizedBox(height: 15),
          if (!checkIsBlockedUser &&
              !checkBlockUser &&
              (text != null && text.isNotEmpty))
            UserPageText(text),
          if (checkBlockUser)
            const OtherUserPageBlockUserText(
                text: 'ブロックしたユーザーです。解除する際は設定からお願いします。'),
          if (checkIsBlockedUser)
            const OtherUserPageBlockUserText(text: 'ブロックされています。'),
        ],
      ),
    );
  }
}
