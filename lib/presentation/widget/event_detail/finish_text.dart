import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EventDetailFinishText extends StatelessWidget {
  const EventDetailFinishText();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.done,
              color: Colors.green[700],
              size: 18,
            ),
            const SizedBox(width: 3),
            const Text(
              '終了したイベントです',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
