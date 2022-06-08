import 'dart:async';
import 'dart:math';

import 'package:my_isp/auth/models/repositories/auth_repository.dart';
import 'package:my_isp/auth/models/user_auth.dart';

class AuthRepositoryMock implements AuthRepository {
  static const _defaultUser = AuthUser(
    '1',
    'Rafael Hiller',
    'teste@teste.com',
  );

  static Map<String, AuthUser> _users = {_defaultUser.email: _defaultUser};
  static AuthUser? _currentUser;
  static MultiStreamController<AuthUser?>? _controller;
  static final _userStream = Stream<AuthUser?>.multi((controller) {
    _controller = controller;
    _updateUser(null);
  });

  @override
  AuthUser? get currentUser => _currentUser;

  @override
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  @override
  Future<void> singup(String name, String email, String password) async {
    final newuser = AuthUser(
      Random().nextDouble().toString(),
      name,
      email,
    );

    _users.putIfAbsent(email, () => newuser);
    _updateUser(newuser);
  }

  @override
  Stream<AuthUser?> get userChanges => _userStream;

  static void _updateUser(AuthUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
