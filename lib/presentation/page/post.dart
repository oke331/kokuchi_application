import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/widget/post/create/body.dart';

class Post extends StatelessWidget {
  const Post();

  static final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: PostBody(formKey: _formKey),
      ),
    );
  }
}
