import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/setting/setting_state.dart';
import 'package:kokuchi_event/presentation/widget/lets_go_list/body.dart';
import 'package:provider/provider.dart';

class LetsGoList extends StatelessWidget {
  const LetsGoList();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context.read<SettingStateNotifier>().reloadLetsGos();
    });

    return const Scaffold(
      body: LetsGoListBody(),
    );
  }
}
