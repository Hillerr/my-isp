import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IPTVPage extends StatelessWidget {
  const IPTVPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 1,
          centerTitle: true,
          title: Text(
            "IPTV",
            style: GoogleFonts.quicksand(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        ),
        body: const Center(
          child: Text("Serviços de IPTV"),
        ));
  }
}
