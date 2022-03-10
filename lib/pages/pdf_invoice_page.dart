import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_isp/core/models/invoice.dart';

class PDFInvoicePage extends StatefulWidget {
  const PDFInvoicePage({Key? key}) : super(key: key);

  @override
  State<PDFInvoicePage> createState() => _PDFInvoicePageState();
}

class _PDFInvoicePageState extends State<PDFInvoicePage> {
  bool _isLoading = true;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromURL(
        'https://backend.intelbras.com/sites/default/files/2020-01/Datasheet-XFF1-XFF2-01.20.pdf');

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final invoice = ModalRoute.of(context)!.settings.arguments as Invoice;

    invoice.loadDocument();

    setState(() {
      _isLoading = false;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Fatura ${DateFormat("MM/yyyy").format(invoice.expiryDate)}",
          style: GoogleFonts.quicksand(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w500,
              fontSize: 20),
        ),
      ),
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(document: document),
      ),
    );
  }
}
