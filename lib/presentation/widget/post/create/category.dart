import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/common/category_data.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/widget/common/wrap_button.dart';
import 'package:provider/provider.dart';

class PostCategory extends StatelessWidget {
  const PostCategory();

  @override
  Widget build(BuildContext context) {
    return CommonWrapButton(
      groupValue: context.select((MyEventEditState value) => value.category),
      onChanged: (val) => _onChanged(context, val),
      data: categoryData,
    );
  }

  void _onChanged(BuildContext context, String value) {
    context.read<MyEventEditStateNotifier>().changeCategory(value);
  }
}
