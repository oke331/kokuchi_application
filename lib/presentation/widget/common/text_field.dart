import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {TextEditingController controller,
      ValueChanged<String> onChanged,
      String hintText = '',
      String initialValue,
      int maxLength,
      String Function(String) validator,
      TextInputType keyboardType,
      List<TextInputFormatter> inputFormatters,
      EdgeInsets margin})
      : _controller = controller,
        _hintText = hintText,
        _initialValue = initialValue,
        _onChanged = onChanged,
        _maxLength = maxLength,
        _validator = validator,
        _keyboardType = keyboardType,
        _inputFormatters = inputFormatters,
        _margin = margin ?? const EdgeInsets.only(left: 15, right: 15);

  final TextEditingController _controller;
  final String _hintText;
  final String _initialValue;
  final ValueChanged<String> _onChanged;
  final int _maxLength;
  final String Function(String) _validator;
  final TextInputType _keyboardType;
  final List<TextInputFormatter> _inputFormatters;
  final EdgeInsets _margin;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: _margin,
      style: const NeumorphicStyle(
        depth: -4,
        boxShape: NeumorphicBoxShape.stadium(),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
      child: TextFormField(
        inputFormatters: _inputFormatters,
        keyboardType: _keyboardType,
        initialValue: _initialValue,
        validator: _validator,
        onChanged: _onChanged,
        controller: _controller,
        decoration: InputDecoration.collapsed(hintText: _hintText)
            .copyWith(counterText: ''),
        maxLength: _maxLength,
      ),
    );
  }
}
