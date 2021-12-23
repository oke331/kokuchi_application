import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/widget/post/create/body.dart';

class PostEdit extends StatelessWidget {
  PostEdit({EventDetailState eventDetailData})
      : _eventDetailData = eventDetailData;

  final EventDetailState _eventDetailData;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
//          appBar: NeumorphicAppBar(
//            title: const Text('編集'),
//          ),
          body: PostBody(
        eventDetailData: _eventDetailData,
        formKey: _formKey,
      )),
    );
  }
}
