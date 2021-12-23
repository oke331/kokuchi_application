import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/search/search_state.dart';
import 'package:kokuchi_event/presentation/widget/common/text_field.dart';
import 'package:kokuchi_event/presentation/widget/home/search/condition_dialog/search_condition.dart';
import 'package:kokuchi_event/presentation/widget/home/search/search_button.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  const Search();

  @override
  Widget build(BuildContext context) {
    final searchWord = context.select((SearchState value) => value.searchWord);

    return Column(
      children: <Widget>[
        const SizedBox(height: 5),
        Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: CommonTextField(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                maxLength: 50,
                onChanged: (val) async => _onChanged(val, context),
                hintText: '検索ワード',
                initialValue: searchWord,
              ),
            ),
            const Expanded(flex: 2, child: SearchCondition()),
            const Expanded(flex: 2, child: SearchButton()),
          ],
        )
      ],
    );
  }

  Future<void> _onChanged(String val, BuildContext context) async {
    await context.read<SearchStateNotifier>().changeSearchWord(val);
  }
}
