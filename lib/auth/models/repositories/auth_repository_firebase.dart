import 'package:my_isp/auth/models/repositories/auth_repository.dart';
import 'package:my_isp/auth/models/user_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryFirebase implements AuthRepository {
  static AuthUser? _currentUser;
  static final _userStream = Stream<AuthUser?>.multi((controller) async {
    final authChanges = FirebaseAuth.instance.authStateChanges();
    await for (var user in authChanges) {
      _currentUser = user == null ? null : _toAuthUser(user);
      controller.add(_currentUser);
    }
  });

  static AuthUser _toAuthUser(User user, [String? name]) {
    return AuthUser(
      user.uid,
      name ?? user.displayName ?? user.email!.split('@')[0],
      user.email!,
    );
  }

  @override
  AuthUser? get currentUser => _currentUser;

  @override
  Future<void> login(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Stream<AuthUser?> get userChanges => _userStream;
}
