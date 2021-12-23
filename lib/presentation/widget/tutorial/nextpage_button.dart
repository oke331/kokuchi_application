import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/route/route_name.dart';

class TutorialNextPageButton extends StatelessWidget {
  const TutorialNextPageButton({@required GlobalKey<FormState> formKey})
      : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: () => _nextPagePressed(context),
      child: const Text('次へ進む'),
    );
  }

  void _nextPagePressed(BuildContext context) {
    if (_formKey.currentState.validate()) {
      Navigator.of(context).pushNamed(RouteName.tutorialUserIcon);
    }
  }
}
