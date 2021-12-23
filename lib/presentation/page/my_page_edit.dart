import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:kokuchi_event/application/user_app_service.dart';
import 'package:kokuchi_event/domain/user/user_repository_base.dart';
import 'package:kokuchi_event/infrastructure/user/user_factory.dart';
import 'package:kokuchi_event/presentation/notifier/user/my_page_edit/my_page_edit_state.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/my_page_edit/body.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class MyPageEdit extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<MyPageEditStateNotifier, MyPageEditState>(
        create: (_) => MyPageEditStateNotifier(
              app: UserAppService(
                factory: const UserFactory(),
                repository: context.read<UserRepositoryBase>(),
              ),
            ),
        builder: (context, child) {
          return WillPopScope(
            onWillPop: () async => !context.read<MyPageEditState>().isLoading,
            child: ModalProgressHUD(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Scaffold(
                  appBar: _appBar(),
                  body: MyPageEditBody(formKey: _formKey),
                ),
              ),
              progressIndicator: const CenterLoading(),
              inAsyncCall:
                  context.select((MyPageEditState value) => value.isLoading),
            ),
          );
        });
  }

  NeumorphicAppBar _appBar() {
    return NeumorphicAppBar(
      title: const Text(
        'ユーザー情報変更',
      ),
      centerTitle: true,
    );
  }
}
