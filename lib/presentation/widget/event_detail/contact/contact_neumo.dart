import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/event/event_detail/event_detail_state.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/contact/email.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/contact/phone_number.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/contact/user.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/contents_headline.dart';
import 'package:kokuchi_event/presentation/widget/event_detail/neumo_headline.dart';
import 'package:provider/provider.dart';

class EventDetailContactNeumo extends StatelessWidget {
  const EventDetailContactNeumo();

  @override
  Widget build(BuildContext context) {
    final email = context.select((EventDetailState value) => value.email);
    final phoneNumber =
        context.select((EventDetailState value) => value.phoneNumber);

    return Neumorphic(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      child: Column(children: <Widget>[
        const EventDetailNeumoHeadline(text: '- Contact -'),
        const SizedBox(height: 25),
        if (email != null && email.isNotEmpty)
          const EventDetailContentsHeadline(text: 'メールアドレス'),
        if (email != null && email.isNotEmpty) const EventDetailEmail(),
        if (email != null && email.isNotEmpty) const SizedBox(height: 25),
        if (phoneNumber != null && phoneNumber.isNotEmpty)
          const EventDetailContentsHeadline(text: '電話番号'),
        if (phoneNumber != null && phoneNumber.isNotEmpty)
          const EventDetailPhoneNumber(),
        if (phoneNumber != null && phoneNumber.isNotEmpty)
          const SizedBox(height: 25),
        const EventDetailUser(),
        const SizedBox(height: 10),
      ]),
    );
  }
}
