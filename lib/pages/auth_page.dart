import 'package:flutter/material.dart';
import 'package:my_isp/components/auth/auth_form.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      body: Center(
        child: SingleChildScrollView(child: AuthForm()),
      ),
    );
  }
}
