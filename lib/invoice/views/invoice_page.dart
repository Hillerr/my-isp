import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/invoice/views/components/invoice_card.dart';
import 'package:my_isp/invoice/controllers/invoice_controller.dart';

class FinantialPage extends StatefulWidget {
  const FinantialPage({Key? key}) : super(key: key);

  @override
  _FinantialPageState createState() => _FinantialPageState();
}

class _FinantialPageState extends State<FinantialPage> {
  final controller = InvoiceController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
            ),
            width: double.infinity,
            child: Text(
              "Minhas Faturas",
              style: GoogleFonts.quicksand(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87),
            ),
          ),
          FutureBuilder(
            future: controller.load(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  alignment: Alignment.bottomCenter,
                  child: const CircularProgressIndicator(),
                );
              } else if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InvoiceCard(invoice: controller.items[index]);
                    },
                    itemCount: controller.itemsCount,
                  ),
                );
              } else {
                return Container(
                  alignment: Alignment.bottomCenter,
                  child: const Text('Não há boletos'),
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
