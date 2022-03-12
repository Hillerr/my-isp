import 'package:flutter/material.dart';
import 'package:my_isp/app.dart';
import 'package:my_isp/core/models/internet_plan_list.dart';
import 'package:my_isp/core/models/invoice_list.dart';
import 'package:my_isp/core/models/notification_list.dart';
import 'package:my_isp/core/models/user_auth.dart';
import 'package:my_isp/pages/auth_or_home_page.dart';
import 'package:my_isp/pages/auth_page.dart';
import 'package:my_isp/pages/notifications_page.dart';
import 'package:my_isp/pages/pdf_invoice_page.dart';
import 'package:my_isp/pages/plan_services.dart';
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
        ChangeNotifierProvider(create: (_) => AuthUser()),
        ChangeNotifierProxyProvider<AuthUser, InvoiceList>(
          create: (_) => InvoiceList('', '', []),
          update: (context, auth, previous) {
            return InvoiceList(
                auth.token ?? '', auth.uid ?? '', previous?.items ?? []);
          },
        ),
        ChangeNotifierProxyProvider<AuthUser, NotificationList>(
          create: (_) => NotificationList('', '', []),
          update: (context, auth, previous) {
            return NotificationList(
                auth.token ?? '', auth.uid ?? '', previous?.items ?? []);
          },
        ),
        ChangeNotifierProxyProvider<AuthUser, InternetPlanList>(
          create: (_) => InternetPlanList('', '', []),
          update: (context, auth, previous) {
            return InternetPlanList(
                auth.token ?? '', auth.uid ?? '', previous?.items ?? []);
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            textTheme:
                const TextTheme(headline1: TextStyle(color: Colors.white))),
        home: const App(),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.AUTH,
        routes: {
          AppRoutes.AUTH_OR_HOME: (context) => const AuthOrHome(),
          AppRoutes.AUTH: (context) => const AuthPage(),
          AppRoutes.SERVICES: (context) => const PlanServicesPage(),
          AppRoutes.NOTIFICATIONS: (context) => const NotificationsPage(),
          AppRoutes.PLAN_UPGRADE: (context) => const PlanServicesPage(),
        },
      ),
    );
  }
}
