import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/common/string.dart';
import 'package:kokuchi_event/main.dart';
import 'package:kokuchi_event/presentation/notifier/auth/auth_state.dart';
import 'package:kokuchi_event/presentation/widget/common/center_loading.dart';
import 'package:kokuchi_event/presentation/widget/common/toast.dart';
import 'package:kokuchi_event/presentation/widget/login/privacy_policy_button.dart';
import 'package:kokuchi_event/presentation/widget/login/term_of_use_button.dart';
import 'package:kokuchi_event/presentation/widget/version_check/updator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class LoginBody extends StatelessWidget {
  const LoginBody();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: ModalProgressHUD(
            progressIndicator: const CenterLoading(),
            inAsyncCall: context.select((AuthState value) => value.isLoading),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/login_icon.png',
                          fit: BoxFit.fill,
                          width: 150,
                          height: 150,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: NeumorphicText(
                            'Kokuchi',
                            textAlign: TextAlign.center,
                            style: const NeumorphicStyle(
                              depth: 1,
                              color: Color(0xFF58BB73),
                            ),
                            textStyle: NeumorphicTextStyle(
                                fontSize: 40,
                                fontFamily: GoogleFonts.fredokaOne()
                                    .fontFamily //customize size here
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    SignInButton(
                      Buttons.Google,
                      onPressed: () => _googleLogin(context),
                    ),
                    const SizedBox(height: 30),
                    if (context
                        .select((AuthState s) => s.isAvailableApple ?? false))
                      SignInButton(
                        Buttons.Apple,
                        onPressed: () => _appleLogin(context),
                      ),
                    if (context
                        .select((AuthState s) => s.isAvailableApple ?? false))
                      const SizedBox(height: 30),
                    const LoginTermOfUseButton(),
                    const SizedBox(height: 30),
                    const LoginPrivacyPolicyButton(),
                    const SizedBox(height: 35),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        '登録またはログインすることで、利用規約とプライバシーポリシーに同意したものとみなされます。',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
        const Updater(),
      ],
    );
  }

  Future<void> _googleLogin(BuildContext context) async {
    if (context.read<AuthState>().isLoading) return;
    context.read<AuthStateNotifier>().loadingChange(val: true);
    try {
      await context.read<AuthStateNotifier>().googleLogin();
    } on AuthCancelException catch (e) {
      logger.d(e);
    } on NoAuthException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on PlatformException catch (e, s) {
      if (e.code == 'network_error') {
        await commonToast(msg: CommonString.noNetworkError);
      } else {
        await commonToast(msg: CommonString.exceptionError);
        await FirebaseCrashlytics.instance.recordError(e, s);
      }
      logger.e(e.toString());
    } on Exception catch (e, s) {
      logger.e(e.toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      context.read<AuthStateNotifier>().loadingChange(val: false);
    }
  }

  Future<void> _appleLogin(BuildContext context) async {
    if (context.read<AuthState>().isLoading) return;
    context.read<AuthStateNotifier>().loadingChange(val: true);
    try {
      await context.read<AuthStateNotifier>().appleLogin();
    } on AuthCancelException catch (e) {
      logger.d(e);
    } on NoAuthException catch (e, s) {
      await commonToast(msg: e.message);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } on Exception catch (e, s) {
      logger.e(e.toString());
      await commonToast(msg: CommonString.exceptionError);
      await FirebaseCrashlytics.instance.recordError(e, s);
    } finally {
      context.read<AuthStateNotifier>().loadingChange(val: false);
    }
  }
}
