import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/lets_go/lets_go_state.dart';
import 'package:provider/provider.dart';

class OtherUserPageLeading extends StatelessWidget {
  const OtherUserPageLeading();

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: const NeumorphicStyle(
          boxShape: NeumorphicBoxShape.circle(), depth: 3),
      margin: const EdgeInsets.only(left: 10, top: 5),
      padding: const EdgeInsets.all(9),
      onPressed: () => _onPressed(context),
      child: Platform.isAndroid
          ? const Icon(Icons.arrow_back)
          : const Icon(
              CupertinoIcons.back,
              size: 28,
            ),
    );
  }

  void _onPressed(BuildContext context) {
    // いきたい中は画面が戻らないよう変更
    final letsGoIsLoading = context.read<LetsGoState>().isLoadingChangeLetsGo;
    if (letsGoIsLoading) return;

    Navigator.pop(context);
  }
}
