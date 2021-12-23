import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/widget/home/search/condition_dialog/category.dart';
import 'package:kokuchi_event/presentation/widget/home/search/condition_dialog/condition_text.dart';
import 'package:kokuchi_event/presentation/widget/home/search/condition_dialog/date_time.dart';
import 'package:kokuchi_event/presentation/widget/home/search/condition_dialog/dialog_search_button.dart';
import 'package:kokuchi_event/presentation/widget/home/search/condition_dialog/online.dart';

class SearchCondition extends StatelessWidget {
  const SearchCondition();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: NeumorphicButton(
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(
                const BorderRadius.all(Radius.circular(18)))),
        child: const Text(
          '条件',
          style: TextStyle(fontSize: 13),
          textAlign: TextAlign.center,
        ),
        onPressed: () => _onPressed(context),
      ),
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    await AwesomeDialog(
        dialogType: DialogType.NO_HEADER,
        context: context,
        headerAnimationLoop: false,
        animType: AnimType.BOTTOMSLIDE,
        title: '検索条件',
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SearchConditionText(),
            const SizedBox(height: 15),
            SearchDateTime(),
            const SizedBox(height: 25),
            const Text('オンライン / オフライン'),
            const SizedBox(height: 5),
            const SearchOnline(),
            const SizedBox(height: 25),
            const Text('カテゴリー'),
            const SizedBox(height: 5),
            const SearchCategory(),
            const SizedBox(height: 20),
            const SearchDialogSearchButton(),
          ],
        )).show();
  }
}
