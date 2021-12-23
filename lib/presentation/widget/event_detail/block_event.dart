import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EventDetailBlockEvent extends StatelessWidget {
  const EventDetailBlockEvent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(),
      body: const Center(child: Text('ブロックしたユーザーのイベントです。\n解除する際は設定から行ってください。')),
    );
  }
}
