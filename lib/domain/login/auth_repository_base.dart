import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class AuthRepositoryBase {
  Future<auth.User> googleLogin();
//  Future<void> googleLogout();
  Future<bool> isAvailableApple();
  Future<auth.User> appleLogin();
//  Future<void> appleLogout();
  Future<void> logout();
//  Future<AuthProviderData> authProviderCheck();
  Future<auth.User> initCurrentAuth();
}
