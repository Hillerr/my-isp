import 'package:flutter/material.dart';
import 'package:my_isp/app.dart';
import 'package:my_isp/home/controllers/ilimited_internet_controller.dart';
import 'package:my_isp/home/models/repositories/notification/notification_repository.dart';
import 'package:my_isp/home/models/repositories/notification/notification_repository_firebase.dart';
import 'package:my_isp/home/views/ilimited_internet_page.dart';
import 'package:my_isp/home/views/iot_devices_page.dart';
import 'package:my_isp/home/views/iptv_page.dart';
import 'package:my_isp/home/views/plan_test_page.dart';
import 'package:my_isp/network/models/parental_control.dart';
import 'package:my_isp/network/views/parental_control_page.dart';
import 'package:my_isp/network/views/ssid_config_page.dart';
import 'package:my_isp/auth/views/auth_or_home_page.dart';
import 'package:my_isp/auth/views/auth_page.dart';
import 'package:my_isp/network/views/visitor_pwd_page.dart';
import 'package:my_isp/home/views/notifications_page.dart';
import 'package:my_isp/home/views/plan_services.dart';
import 'package:my_isp/utils/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NotificationService(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationRepositoryFirebase(),
        ),
        ChangeNotifierProvider(
          create: (_) => ParentalControl(),
        ),
        ChangeNotifierProvider(create: (_) => IlimitedInternetController())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            textTheme:
                const TextTheme(headline1: TextStyle(color: Colors.white))),
        home: const App(),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.AUTH_OR_HOME,
        routes: {
          AppRoutes.AUTH_OR_HOME: (context) => const AuthOrHome(),
          AppRoutes.AUTH: (context) => const AuthPage(),
          AppRoutes.SERVICES: (context) => const PlanServicesPage(),
          AppRoutes.NOTIFICATIONS: (context) => const NotificationsPage(),
          AppRoutes.PLAN_UPGRADE: (context) => const PlanServicesPage(),
          AppRoutes.PARENTAL_CONTROL: (context) => const ParentalControlPage(),
          AppRoutes.SSID_CONFIG: (context) => SSIDConfigPage(),
          AppRoutes.VISITOR_PWD_PAGE: (context) => const VisitorPwdPage(),
          AppRoutes.ILIMITED_INTERNET: (context) =>
              const IlimitedInternetPage(),
          AppRoutes.PLAN_TEST: (context) => const PlanTestPage(),
          AppRoutes.IOT_DEVICES: (context) => const IoTDevicesPage(),
          AppRoutes.IPTV: (context) => const IPTVPage(),
        },
      ),
    );
  }
}
