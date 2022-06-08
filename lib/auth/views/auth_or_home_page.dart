import 'package:flutter/material.dart';
import 'package:my_isp/app.dart';
import 'package:my_isp/auth/models/repositories/auth_repository.dart';
import 'package:my_isp/home/models/repositories/notification/notification_repository_firebase.dart';
import 'package:my_isp/utils/color_scheme.dart';
import 'package:provider/provider.dart';
import 'auth_page.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthOrHome extends StatelessWidget {
  const AuthOrHome({Key? key}) : super(key: key);

  Future<void> init(BuildContext context) async {
    await Firebase.initializeApp();
    await Provider.of<NotificationRepositoryFirebase>(context).init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: init(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColorScheme.headColor),
            );
          } else {
            return StreamBuilder(
              stream: AuthRepository().userChanges,
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
                  return snapshot.hasData ? const App() : const AuthPage();
                }
              },
            );
          }
        });
  }
}
