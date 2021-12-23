import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/widget/user_page/edit.dart';
import 'package:kokuchi_event/presentation/widget/user_page/icon.dart';
import 'package:kokuchi_event/presentation/widget/user_page/name.dart';
import 'package:kokuchi_event/presentation/widget/user_page/prefecture.dart';
import 'package:kokuchi_event/presentation/widget/user_page/text.dart';
import 'package:provider/provider.dart';

class MyPageCard extends StatelessWidget {
  const MyPageCard();

  @override
  Widget build(BuildContext context) {
    final text = context.select((UserState value) => value.text);
    final prefectureStatus =
        context.select((UserState value) => value.prefectureStatus) ?? false;

    return Neumorphic(
      margin: const EdgeInsets.symmetric(horizontal: 75, vertical: 12),
      padding: const EdgeInsets.only(right: 12, left: 12, top: 20, bottom: 20),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          UserPageIcon(context.select((UserState value) => value.iconUrl)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              UserPageName(context.select((UserState value) => value.name)),
              const UserPageEdit(),
            ],
          ),
          if (prefectureStatus) const SizedBox(height: 10),
          if (prefectureStatus)
            UserPagePrefecture(
                context.select((UserState value) => value.prefecture)),
          if (text != null && text.isNotEmpty) const SizedBox(height: 15),
          if (text != null && text.isNotEmpty) UserPageText(text),
        ],
      ),
    );
  }
}
