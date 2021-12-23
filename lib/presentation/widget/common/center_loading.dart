import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CenterLoading extends StatelessWidget {
  const CenterLoading();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
        ),
      ),
    );
  }
}
