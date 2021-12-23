import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class EventStar extends StatelessWidget {
  const EventStar();

  @override
  Widget build(BuildContext context) {
    const starColor = NeumorphicStyle(
        color: Colors.yellowAccent, border: NeumorphicBorder(width: 0.5));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        NeumorphicIcon(Icons.star, style: starColor),
        NeumorphicIcon(Icons.star, style: starColor),
        NeumorphicIcon(Icons.star, style: starColor),
        NeumorphicIcon(Icons.star, style: starColor),
        NeumorphicIcon(Icons.star_half, style: starColor),
      ],
    );
  }
}
