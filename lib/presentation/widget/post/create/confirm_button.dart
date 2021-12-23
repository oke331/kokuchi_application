import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/my_event_edit/my_event_edit_state.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:provider/provider.dart';

class PostConfirmButton extends StatelessWidget {
  const PostConfirmButton(this._formKey);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NeumorphicButton(
        onPressed: () async => _onPressed(context),
        style: const NeumorphicStyle(
          surfaceIntensity: 0.15,
          shape: NeumorphicShape.flat,
        ),
        child: const Text(
          '確認画面へ',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      await Navigator.of(context, rootNavigator: true).pushNamed(
        RouteName.postConfirm,
        arguments: [
          context.read<MyEventEditState>(),
          context.read<MyEventEditStateNotifier>()
        ],
      );
    } else {
      await commonToast(msg: '正しく入力されていない項目があります');
    }
  }
}
