import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/application/dto/user_dto.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/block_user/block_user_state.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:kokuchi_event/presentation/widget/setting/account/block_user/user_tile.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class BlockUserInfo extends StatelessWidget {
  BlockUserInfo();

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() async {
      await _scrollListener(context);
    });

    final usersDto =
        context.select((BlockUserState value) => value.blockUsersDto);

    final init = context.select((BlockUserState value) => value.init);

    return WillPopScope(
      onWillPop: () async => !context.read<BlockUserState>().isLoading,
      child: ModalProgressHUD(
        progressIndicator: const CenterLoading(),
        inAsyncCall: context.select((BlockUserState value) => value.isLoading),
        child: Scaffold(
          appBar: NeumorphicAppBar(title: const Text('ブロックしたユーザー')),
          body: !init
              ? const SizedBox.shrink()
              : usersDto == null || usersDto.isEmpty
                  ? const Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'ブロックしたユーザーはいません。',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemCount: usersDto.length,
                      itemBuilder: (context, index) {
                        return Provider<UserDto>.value(
                            value: usersDto[index],
                            child: const BlockUserTile());
                      }),
        ),
      ),
    );
  }

  Future<void> _scrollListener(BuildContext context) async {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (context.read<BlockUserState>().isLoadingScroll) return;
      final BlockUserStateNotifier stateNotifier =
          context.read<BlockUserStateNotifier>();
      stateNotifier.changeLoadingScrollI(val: true);
      try {
        await stateNotifier.fetchBlockUsers();
      } on GenericException catch (e, s) {
        await commonToast(msg: e.message);
        await FirebaseCrashlytics.instance.recordError(e, s);
      } on Exception catch (e, s) {
        logger.d(e.toString());
        await commonToast(msg: CommonString.exceptionError);
        await FirebaseCrashlytics.instance.recordError(e, s);
      }
      await stateNotifier.fetchBlockUsers();
      stateNotifier.changeLoadingScrollI(val: false);
    }
  }
}
