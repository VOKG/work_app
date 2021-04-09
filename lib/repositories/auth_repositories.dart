import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/all.dart';

abstract class BaseAuthRepository{
  Stream<User> get authStateChanges;
  Future<void> singInAnonymously();
  User getCurrentUser();
  Future<void> singOut();

}

class AuthRepository implements BaseAuthRepository{
  final Reader _read;

  const AuthRepository(this._read);

  @override
  // TODO: implement authStateChanges
  Stream<User> get authStateChanges => throw UnimplementedError();

  @override
  User getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<void> singInAnonymously() {
    // TODO: implement singInAnonymously
    throw UnimplementedError();
  }

  @override
  Future<void> singOut() {
    // TODO: implement singOut
    throw UnimplementedError();
  }
}