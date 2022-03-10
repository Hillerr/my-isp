import 'package:flutter/material.dart';
import 'package:my_isp/app.dart';
import 'package:my_isp/core/models/user_auth.dart';
import 'package:my_isp/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'auth_page.dart';

class AuthOrHome extends StatelessWidget {
  const AuthOrHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthUser auth = Provider.of<AuthUser>(context);
    return FutureBuilder(
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.error != null) {
          return const Center(
            child: Text('Ocorreu um erro'),
          );
        } else {
          return auth.isAuth ? App() : AuthPage();
        }
      },
      future: auth.tryAutoLogin(),
    );
  }
}
