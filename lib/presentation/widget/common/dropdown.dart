import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CommonDropdown extends StatelessWidget {
  const CommonDropdown(
      {@required String selectItem,
      @required List<String> itemList,
      @required ValueChanged<String> onChanged})
      : _selectItem = selectItem,
        _itemList = itemList,
        _onChanged = onChanged;

  final String _selectItem;
  final List<String> _itemList;
  final ValueChanged<String> _onChanged;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyText1.color;

    return DropdownButton<String>(
      value: _selectItem,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      underline: Container(
        height: 2,
        color: textColor,
      ),
      onChanged: _onChanged,
      items: _itemList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
