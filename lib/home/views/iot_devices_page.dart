import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IoTDevicesPage extends StatelessWidget {
  const IoTDevicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 1,
          centerTitle: true,
          title: Text(
            "Requisitar Dispositivos IoT",
            style: GoogleFonts.quicksand(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
        body: const Center(
          child: Text("Dispositivos IoT"),
        ));
  }
}
