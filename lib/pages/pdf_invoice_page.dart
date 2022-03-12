import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/core/models/invoice.dart';
import 'package:my_isp/core/services/pdf_service.dart';
import 'package:path/path.dart';

class PDFInvoicePage extends StatefulWidget {
  final File file;
  const PDFInvoicePage({Key? key, required this.file}) : super(key: key);

  @override
  State<PDFInvoicePage> createState() => _PDFInvoicePageState();
}

class _PDFInvoicePageState extends State<PDFInvoicePage> {
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Fatura",
          style: GoogleFonts.quicksand(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w400,
              fontSize: 25),
        ),
      ),
      body: PDFView(
        filePath: widget.file.path,
      ),
    );
  }
}
