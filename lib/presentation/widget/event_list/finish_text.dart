import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EventListFinishText extends StatelessWidget {
  const EventListFinishText();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.done,
              color: Colors.green[700],
              size: 13,
            ),
            const SizedBox(width: 3),
            const Text(
              '終了したイベント',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
      ],
    );
  }
}
