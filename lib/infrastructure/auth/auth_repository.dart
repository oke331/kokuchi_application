import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kokuchi_event/common/exception.dart';
import 'package:kokuchi_event/domain/login/auth_repository_base.dart';

class AuthRepository extends AuthRepositoryBase {
  final _auth = auth.FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn(hostedDomain: '');

  @override
  Future<auth.User> googleLogin() async {
    final googleSignInAccount = await _googleSignIn.signIn();

    if (googleSignInAccount == null) {
      throw AuthCancelException();
    }

    final googleSignInAuthentication = await googleSignInAccount.authentication;

    final credential = auth.GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final authResult = await _auth.signInWithCredential(credential);
    final user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    if (currentUser == null) {
      throw NoAuthException();
    }
    return user;
  }

  @override
  Future<bool> isAvailableApple() {
    return AppleSignIn.isAvailable();
  }

  @override
  Future<auth.User> appleLogin() async {
    final appleResult = await AppleSignIn.performRequests([
      const AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);

    if (appleResult.error != null) {
      throw AuthCancelException();
    }

    final credential = auth.OAuthProvider('apple.com').credential(
      accessToken:
          String.fromCharCodes(appleResult.credential.authorizationCode),
      idToken: String.fromCharCodes(appleResult.credential.identityToken),
    );

    final firebaseResult = await _auth.signInWithCredential(credential);
    final user = firebaseResult.user;

    return user;
  }

//  @override
//  Future<void> appleLogout() async {
//    await _auth.signOut();
//  }
//
//  @override
//  Future<void> googleLogout() async {
//    // 両方サインアウトしないと再度ログイン時にログインできてしまう
//    await _googleSignIn.signOut();
//    await _auth.signOut();
//  }

  @override
  Future<void> logout() async {
    // 両方サインアウトしないと再度ログイン時にログインできてしまう
    await _auth.signOut();

    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.signOut();
    }
  }

//  @override
//  Future<AuthProviderData> authProviderCheck() async {
//    final currentUser = await _auth.currentUser();
//    if (currentUser == null) {
//      throw NoAuthException();
//    }
//
//    if (currentUser.providerId == GoogleAuthProvider.providerId) {
//      return AuthProviderData.google;
//    } else {
//      return AuthProviderData.apple;
//    }
//  }

  @override
  Future<auth.User> initCurrentAuth() async {
    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      throw NoAuthException();
    }
    return currentUser;
  }
}
