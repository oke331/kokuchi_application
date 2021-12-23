import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/setting/setting_state.dart';
import 'package:kokuchi_event/presentation/widget/setting/body.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await context
          .read<SettingStateNotifier>()
          .getCheckNotificationPermStatus();
    });

    return Scaffold(
      appBar: NeumorphicAppBar(
        centerTitle: true,
        title: const Text('設定'),
      ),
      body: const SettingBody(),
    );
  }
}
