import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:kokuchi_event/presentation/widget/my_page_edit/icon.dart';
import 'package:kokuchi_event/presentation/widget/my_page_edit/name.dart';
import 'package:kokuchi_event/presentation/widget/my_page_edit/prefecture_dropbox.dart';
import 'package:kokuchi_event/presentation/widget/my_page_edit/prefecture_status_check.dart';
import 'package:kokuchi_event/presentation/widget/my_page_edit/text.dart';
import 'package:kokuchi_event/presentation/widget/my_page_edit/update_button.dart';

class MyPageEditBody extends StatelessWidget {
  const MyPageEditBody({@required GlobalKey<FormState> formKey})
      : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20),
              const MyPageEditIcon(),
              const SizedBox(height: 20),
              const Text('*ユーザー名 - 20文字以内'),
              const SizedBox(height: 10),
              const MyPageEditName(),
              const SizedBox(height: 30),
              const Text('*住んでいる地域'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  MyPageEditPrefectureDropbox(),
                  SizedBox(width: 30),
                  Text('他のユーザーに公開'),
                  MyPageEditStatusCheck(),
                ],
              ),
              const SizedBox(height: 30),
              const Text('自己紹介 -100文字以内'),
              const SizedBox(height: 10),
              const MyPageEditText(),
              const SizedBox(height: 40),
              MyPageEditUpdateButton(
                formKey: _formKey,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
