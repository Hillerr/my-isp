import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_isp/core/models/internet_plan.dart';
import 'package:my_isp/core/services/store.dart';

class AuthUser with ChangeNotifier {
  String? _token;
  String? _email;
  String? _uid;
  DateTime? _expiryDate;
  Timer? _logoutTimer;
  InternetPlan? _internetPlan;

  bool get isAuth {
    final isValid = _expiryDate?.isAfter(DateTime.now()) ?? false;
    // return _token != null && isValid;
    return _token != null;
  }

  String? get token {
    return isAuth ? _token : null;
  }

  String? get uid {
    return isAuth ? _uid : null;
  }

  static const _loginUrl =
      "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyC0wfSG1HQnv_2HZDNZF5Cit-_gTAYcqaw";

  Future<void> _authenticate(
      String? email, String? password, String uri) async {
    final response = await http.post(
      Uri.parse(uri),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw Exception(body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['email'];
      _uid = body['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(body['expiresIn']),
        ),
      );

      print(_token);

      Store.saveMap('userData', {
        'token': _token,
        'email': _email,
        'userId': _uid,
        'expiryDate': _expiryDate!.toIso8601String(),
      });

      //_autoLogout();
      notifyListeners();
    }
  }

  Future<void> tryAutoLogin() async {
    if (isAuth) {
      return;
    }

    final userData = await Store.getMap('userData');

    print(userData);

    if (userData.isEmpty) {
      print(userData);
      return;
    }

    final expiryDate = DateTime.parse(userData['expiryDate']);

    if (expiryDate.isBefore(DateTime.now())) return;

    _token = userData['token'];
    _email = userData['email'];
    _uid = userData['userId'];
    _expiryDate = expiryDate;
  }

  Future<void> login(String? email, String? password) {
    return _authenticate(email, password, _loginUrl);
  }

  Future<void> logout() async {
    _token = null;
    _email = null;
    _uid = null;
    _expiryDate = null;
    Store.remove('userData');
    _clearAutoLogoutTimer();
    notifyListeners();
  }

  void _clearAutoLogoutTimer() {
    _logoutTimer?.cancel();
    _logoutTimer = null;
  }

  void _autoLogout() {
    _clearAutoLogoutTimer();
    final timeToLogout = _expiryDate?.difference(DateTime.now()).inSeconds;
    _logoutTimer = Timer(Duration(seconds: timeToLogout ?? 0), logout);
  }
}
