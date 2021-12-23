import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';
import 'package:kokuchi_event/presentation/share/launch_url.dart';
import 'package:kokuchi_event/presentation/widget/setting/headline.dart';
import 'package:kokuchi_event/presentation/widget/setting/item_text.dart';

class SettingDeveloper extends StatelessWidget {
  const SettingDeveloper();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SettingHeadline(text: 'アプリ開発関連'),
        const SizedBox(height: 30),
        InkWell(
          child: Row(
            children: const <Widget>[
              SettingItemText(text: '要望・不具合報告', icon: Icons.mail),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
          onTap: () => Navigator.of(context, rootNavigator: true)
              .pushNamed(RouteName.settingDeveloperRequest),
        ),
        // TODO:2回目のリリースで入れる！
//        const SizedBox(height: 30),
//        InkWell(
//          child: Row(
//            children: const <Widget>[
//              SettingItemText(text: 'アプリを評価して応援！！', icon: Icons.favorite),
//              Icon(Icons.keyboard_arrow_right)
//            ],
//          ),
//          onTap: () => Navigator.of(context, rootNavigator: true)
//              .pushNamed(RouteName.settingDeveloperRequest),
//        ),
        const SizedBox(height: 30),
        InkWell(
          child: Row(
            children: const <Widget>[
              SettingItemText(text: 'アプリ開発者Twitter', icon: Icons.person),
              Icon(Icons.keyboard_arrow_right)
            ],
          ),
          onTap: _twitterTap,
        ),
      ],
    );
  }

  Future<void> _twitterTap() async {
    const url = 'twitter://user?screen_name=oke331';
    const secondUrl = 'https://twitter.com/oke331';
    await launchURL(url, secondUrl: secondUrl);
  }

  // TODO:2回目のリリースで入れる！
//  void _reviewTap() {
//    LaunchReview.launch(
//        androidAppId: "com.iyaffle.rangoli", iOSAppId: "585027354");
//  }
}
