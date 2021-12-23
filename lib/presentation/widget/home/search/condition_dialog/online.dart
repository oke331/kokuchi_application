import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/search/search_state.dart';
import 'package:kokuchi_event/presentation/widget/common/wrap_button.dart';
import 'package:provider/provider.dart';

class SearchOnline extends StatelessWidget {
  const SearchOnline();

  static const double fontSize = 12;
  static const onlineConditionList = [
    SearchOnlineCondition.both,
    SearchOnlineCondition.online,
    SearchOnlineCondition.offline
  ];

  @override
  Widget build(BuildContext context) {
    final onlineCheck =
        context.select((SearchState value) => value.onlineCheck);

    return CommonWrapButton(
      groupValue: onlineCheck,
      onChanged: (val) => _onChanged(context, val),
      data: onlineConditionList,
    );
  }

  void _onChanged(BuildContext context, String val) {
    context.read<SearchStateNotifier>().changeOnlineCheck(val);
  }
}
