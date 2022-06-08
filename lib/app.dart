import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/auth/models/repositories/auth_repository.dart';
import 'package:my_isp/auth/models/user_auth.dart';
import 'package:my_isp/invoice/views/invoice_page.dart';
import 'package:my_isp/network/views/network_page.dart';
import 'package:my_isp/home/views/home_page.dart';
import 'package:my_isp/speedtest/views/test_page.dart';
import 'package:my_isp/utils/color_scheme.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _MyAppState();
}

class _MyAppState extends State<App> {
  int currentIdex = 0;
  final screens = [
    const HomePage(),
    const FinantialPage(),
    const NetworkPage(),
    const TestPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColorScheme.backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColorScheme.headColor,
          elevation: 1,
          centerTitle: true,
          title: Text(
            "My ISP",
            style: GoogleFonts.quicksand(
                color: AppColorScheme.backgroundColor,
                fontWeight: FontWeight.w600,
                fontSize: 30),
          ),
          actions: [
            IconButton(
              onPressed: () => AuthRepository().logout(),
              icon: const Icon(
                Icons.logout,
                color: AppColorScheme.backgroundColor,
              ),
            )
          ],
        ),
        body: screens[currentIdex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIdex,
          onTap: (index) => setState(() => currentIdex = index),
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white60,
          selectedItemColor: Colors.white,
          backgroundColor: AppColorScheme.bottonColor,
          selectedIconTheme: const IconThemeData(color: Colors.white),
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.paid_outlined),
              label: 'Cobrança',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.wifi),
              label: 'Rede',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.speed_outlined),
              label: 'Teste',
            ),
          ],
        ));
  }
}
