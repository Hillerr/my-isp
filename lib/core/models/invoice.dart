import 'dart:io';

import 'package:flutter_pdfview/flutter_pdfview.dart';

enum InvoiceStatus { payed, notPayed, expyred }

class Invoice {
  String id;
  DateTime payingDate;
  DateTime expiryDate;
  double value;
  InvoiceStatus status;
  File? doc;

  Invoice({
    required this.id,
    required this.payingDate,
    required this.expiryDate,
    required this.value,
    this.status = InvoiceStatus.notPayed,
  });

  @override
  String toString() {
    switch (status) {
      case InvoiceStatus.expyred:
        return "Expirado";
      case InvoiceStatus.notPayed:
        return "Não pago";
      default:
        return "Pago";
    }
  }

  Future<void> loadDocument() async {
    doc = await File.fromUri(
      Uri.parse(
        'https://backend.intelbras.com/sites/default/files/2020-01/Datasheet-XFF1-XFF2-01.20.pdf',
      ),
    );
  }
}
