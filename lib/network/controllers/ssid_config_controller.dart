import 'dart:io';

class SSIDConfigController {
  bool arePasswordsEquals(String newPwd1, String newPwd2) {
    return newPwd1 == newPwd2;
  }

  Future<void> changeSSID() async {
    await Future.delayed(const Duration(seconds: 2));
  }
}
