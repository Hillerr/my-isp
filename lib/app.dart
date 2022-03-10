import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/pages/finantial_page.dart';
import 'package:my_isp/pages/home_page.dart';
import 'package:my_isp/pages/profile_page.dart';
import 'package:my_isp/pages/test_page.dart';

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
    const ProfilePage(),
    const TestPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey.shade100,
          elevation: 1,
          centerTitle: true,
          title: Text(
            "My ISP",
            style: GoogleFonts.quicksand(
                color: Colors.grey.shade900,
                fontWeight: FontWeight.w400,
                fontSize: 30),
          ),
        ),
        body: screens[currentIdex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIdex,
          onTap: (index) => setState(() => currentIdex = index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black87,
          selectedIconTheme: const IconThemeData(color: Colors.black87),
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
              icon: Icon(Icons.people_outlined),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.speed_outlined),
              label: 'Teste',
            ),
          ],
        ));
  }
}
