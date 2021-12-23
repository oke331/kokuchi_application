import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/category_data.dart';
import 'package:kokuchi_event/presentation/notifier/search/search_state.dart';
import 'package:kokuchi_event/presentation/widget/common/wrap_button.dart';
import 'package:provider/provider.dart';

class SearchCategory extends StatelessWidget {
  const SearchCategory();

  @override
  Widget build(BuildContext context) {
    final categoryPlusNoSelect = <String>[]
      ..add('選択なし')
      ..addAll(categoryData);

    return CommonWrapButton(
      groupValue: context.select((SearchState value) => value.category),
      onChanged: (val) => _onChanged(context, val),
      data: categoryPlusNoSelect,
    );
  }

  void _onChanged(BuildContext context, String value) {
    context.read<SearchStateNotifier>().changeCategory(value);
  }
}
