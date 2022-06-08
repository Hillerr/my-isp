import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/home/controllers/ilimited_internet_controller.dart';
import 'package:my_isp/home/models/ilimited_internet.dart';
import 'package:provider/provider.dart';

class PlanTestPage extends StatelessWidget {
  const PlanTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 1,
          centerTitle: true,
          title: Text(
            "Teste de Plano de Internet",
            style: GoogleFonts.quicksand(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: const Center(
          child: Text("Teste de plano de internet"),
        ));
  }
}
