import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:http/http.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/setting/setting_state.dart';
import 'package:kokuchi_event/presentation/notifier/user/user/user_state.dart';
import 'package:kokuchi_event/presentation/share/network_check.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/common/text_field.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class SettingDeveloperRequest extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const slackToken = '';
  static const channelName = 'kokuchi_request_channel';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !context.read<SettingState>().developerRequestLoading,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ModalProgressHUD(
          inAsyncCall: context
              .select((SettingState value) => value.developerRequestLoading),
          progressIndicator: const CenterLoading(),
          child: Scaffold(
            appBar: NeumorphicAppBar(
              title: const Text('要望・不具合報告'),
              centerTitle: true,
            ),
            body: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 5),
                        const Text('返信連絡先メールアドレス'),
                        const SizedBox(height: 10),
                        CommonTextField(
                          hintText: 'oke@oke.com',
                          onChanged: (value) => context
                              .read<SettingStateNotifier>()
                              .changeDeveloperRequestMail(value),
                          maxLength: 1000,
                          validator: _emailValidate,
                        ),
                        const SizedBox(height: 20),
                        const Text('要望や不具合の内容 -200文字まで'),
                        const SizedBox(height: 10),
                        Neumorphic(
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          style: const NeumorphicStyle(
                            depth: -5,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          child: TextFormField(
                            onChanged: (value) => context
                                .read<SettingStateNotifier>()
                                .changeDeveloperRequestText(value),
                            minLines: 5,
                            validator: _textValidate,
                            maxLength: 200,
                            decoration:
                                const InputDecoration.collapsed(hintText: null),
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                        const SizedBox(height: 20),
                        NeumorphicButton(
                          pressed: !context.select((SettingState value) =>
                              value.developerRequestLoading),
                          style: const NeumorphicStyle(depth: 20),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40),
                          child: const Text('送信'),
                          onPressed: () => _onPressed(context),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _emailValidate(String val) {
    if (val == null || val.isEmpty) {
      return ' *必須入力です';
    }

    if (val != null &&
        val.isNotEmpty &&
        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$")
            .hasMatch(val)) {
      return ' ※メールアドレスを入力してください';
    }

    if (val != null && val.isNotEmpty && val.characters.length > 1000) {
      return ' ※1000文字以内で入力してください';
    }
    return null;
  }

  String _textValidate(String val) {
    if (val == null || val.isEmpty) {
      return ' *必須入力です';
    }
    return null;
  }

  Future<void> _onPressed(BuildContext context) async {
    // インターネット接続をチェック
    if (!await NetworkCheck.isConnect()) {
      await commonToast(msg: CommonString.noNetworkError);
      return;
    }

    if (_formKey.currentState.validate()) {
      if (context.read<SettingState>().developerRequestLoading) return;
      context
          .read<SettingStateNotifier>()
          .changeDeveloperRequestLoading(val: true);
      final mail = context.read<SettingState>().developerRequestMail;
      final text = context.read<SettingState>().developerRequestText;
      final userId = context.read<UserState>().id;
      try {
        final req = Request(
            'POST',
            Uri.https('slack.com', '/api/chat.postMessage', {
              'token': slackToken,
              'channel': channelName,
              'text':
                  '\nーーーーーー要望・不具合ーーーーーー\nユーザーID：$userId\nメールアドレス：$mail\n内容：\n$text',
            }));
        await req.send();
        context.read<SettingStateNotifier>().resetDeveloperRequest();
        await commonToast(msg: 'メッセージを送信しました！\nありがとうございます！');
        Navigator.pop(context);
      } on Exception catch (e, s) {
        logger.d(e);
        await commonToast(msg: 'メッセージの送信に失敗しました。\n申し訳ありません。');
        await FirebaseCrashlytics.instance.recordError(e, s);
      } finally {
        context
            .read<SettingStateNotifier>()
            .changeDeveloperRequestLoading(val: false);
      }
    }
  }
}
