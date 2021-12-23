import 'package:kokuchi_event/domain/login/auth.dart';

abstract class AuthFactoryBase {
  Auth create({String id});
}
