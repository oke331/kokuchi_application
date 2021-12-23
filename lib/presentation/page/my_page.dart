import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/widget/my_page/body.dart';

class MyPage extends StatelessWidget {
  const MyPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: const MyPageBody(),
    );
  }
}
