import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';
import 'package:kokuchi_event/presentation/share/network_check.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';

class SearchButton extends StatelessWidget {
  const SearchButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: NeumorphicButton(
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(
                const BorderRadius.all(Radius.circular(18)))),
        child: const Text(
          '検索',
          style: TextStyle(fontSize: 13),
          textAlign: TextAlign.center,
        ),
        onPressed: () => _onPressed(context),
      ),
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    // インターネット接続をチェック
    if (!await NetworkCheck.isConnect()) {
      await commonToast(msg: CommonString.noNetworkError);
      return;
    }
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(RouteName.searchResult);
  }
}
