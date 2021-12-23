import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/widget/common/neumo_checkbox.dart';
import 'package:provider/provider.dart';

class PostCategoryOnline extends StatelessWidget {
  const PostCategoryOnline();

  static const double fontSize = 12;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Text(
          ' オンラインイベント：',
          style: TextStyle(fontSize: fontSize),
        ),
        NeumoCheckbox(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          boolState: context.select((MyEventEditState value) => value.online),
          onPressed: () => _onPressed(context),
        ),
      ],
    );
  }

  void _onPressed(BuildContext context) {
    context.read<MyEventEditStateNotifier>().toggleOnline();
  }
}
