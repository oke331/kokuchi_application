import 'package:firebase_auth/firebase_auth.dart' as auth;

class AuthDto {
  AuthDto(this.firebaseUser) : id = firebaseUser.uid;
  final String id;
  final auth.User firebaseUser;
}
