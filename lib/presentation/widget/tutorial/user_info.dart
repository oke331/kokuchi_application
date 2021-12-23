import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/widget/tutorial/checkbox.dart';
import 'package:kokuchi_event/presentation/widget/tutorial/name.dart';
import 'package:kokuchi_event/presentation/widget/tutorial/nextpage_button.dart';
import 'package:kokuchi_event/presentation/widget/tutorial/prefecture_dropbox.dart';

class TutorialUserInfo extends StatelessWidget {
  TutorialUserInfo();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: NeumorphicAppBar(
            title: const Text('ユーザー情報入力'),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 20),
                    const Text(
                      'インストールいただき、ありがとうございます。\nお手数ですが、ユーザー情報の入力をお願いします！',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.green, height: 2),
                    ),
                    const SizedBox(height: 35),
                    const Text('*ユーザー名 - 20文字以内'),
                    const TutorialName(),
                    const SizedBox(height: 30),
                    const Text('*住んでいる地域'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        TutorialPrefectureDropbox(),
                        SizedBox(width: 30),
                        Text('他のユーザーに公開'),
                        TutorialCheckbox(),
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Text('入力した情報は後で変更可能です。'),
                    const SizedBox(height: 40),
                    TutorialNextPageButton(
                      formKey: _formKey,
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
