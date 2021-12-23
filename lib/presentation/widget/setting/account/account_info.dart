import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/notifier/auth/auth_state.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/setting/account/account_info_body.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => !context.read<AuthState>().isCancelLoading,
      child: ModalProgressHUD(
        progressIndicator: const CenterLoading(),
        inAsyncCall: context.select((AuthState value) => value.isCancelLoading),
        child: Scaffold(
          appBar: NeumorphicAppBar(
            title: const Text('アカウント管理'),
          ),
          body: const AccountInfoBody(),
        ),
      ),
    );
  }
}
