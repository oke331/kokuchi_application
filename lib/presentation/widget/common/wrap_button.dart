import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CommonWrapButton extends StatelessWidget {
  const CommonWrapButton(
      {@required String groupValue,
      @required Function(String) onChanged,
      @required List<String> data})
      : _grougValue = groupValue,
        _onChanged = onChanged,
        _data = data;

  final String _grougValue;
  final Function(String) _onChanged;
  final List<String> _data;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        for (String value in _data)
          Container(
            height: 35,
            margin: const EdgeInsets.all(5),
            child: NeumorphicRadio<String>(
              padding: const EdgeInsets.all(10),
              style: NeumorphicRadioStyle(
                selectedColor: Colors.green,
                boxShape: NeumorphicBoxShape.roundRect(
                    const BorderRadius.all(Radius.circular(10))),
              ),
              groupValue: _grougValue,
              value: value,
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 10,
                    color: _grougValue == value ? Colors.white : Colors.black),
              ),
              onChanged: _onChanged,
            ),
          ),
      ],
    );
  }
}
