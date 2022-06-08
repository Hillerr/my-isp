import 'package:my_isp/auth/models/repositories/auth_repository_firebase.dart';
import 'package:my_isp/auth/models/repositories/auth_repository_mock.dart';
import 'package:my_isp/auth/models/user_auth.dart';

abstract class AuthRepository {
  AuthUser? get currentUser;

  Stream<AuthUser?> get userChanges;

  Future<void> login(String email, String password);
  Future<void> logout();

  factory AuthRepository() {
    return AuthRepositoryFirebase();
    // return AuthFirebaseRepository();
  }
}
