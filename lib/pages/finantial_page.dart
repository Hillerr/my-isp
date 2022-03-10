import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/components/finantial_page/invoice_card.dart';
import 'package:my_isp/core/models/invoice.dart';
import 'package:my_isp/core/models/invoice_list.dart';
import 'package:provider/provider.dart';

class FinantialPage extends StatefulWidget {
  const FinantialPage({Key? key}) : super(key: key);

  @override
  _FinantialPageState createState() => _FinantialPageState();
}

class _FinantialPageState extends State<FinantialPage> {
  bool _isLoading = true;

  final invoice = Invoice(
    id: '4',
    payingDate: DateTime(2022, 2, 5),
    expiryDate: DateTime(2022, 2, 5),
    value: 250,
  );

  @override
  void initState() {
    super.initState();
    Provider.of<InvoiceList>(
      context,
      listen: false,
    ).loadInvoices().then(
          (value) => setState(() {
            _isLoading = false;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InvoiceList>(context, listen: false);

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
          if (_isLoading)
            Container(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(),
            )
          else
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InvoiceCard(invoice: provider.items[index]);
                },
                itemCount: provider.itemsCount,
              ),
            ),
        ],
      ),
    );
  }
}
