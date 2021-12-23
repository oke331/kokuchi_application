import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';
import 'package:kokuchi_event/presentation/share/network_check.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';

class SearchDialogSearchButton extends StatelessWidget {
  const SearchDialogSearchButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        NeumorphicButton(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: const Text(
            '閉じる',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => Navigator.pop(context),
          style: NeumorphicStyle(color: Colors.grey),
        ),
        const SizedBox(width: 25),
        NeumorphicButton(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: const Text(
            '検索',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => _onPressed(context),
          style: NeumorphicStyle(color: Colors.green),
        ),
      ],
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    // インターネット接続をチェック
    if (!await NetworkCheck.isConnect()) {
      await commonToast(msg: CommonString.noNetworkError);
      return;
    }

    Navigator.pop(context);
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(RouteName.searchResult);
  }
}
