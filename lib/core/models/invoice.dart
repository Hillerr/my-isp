import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

enum InvoiceStatus { payed, notPayed, expyred }

class Invoice {
  String id;
  DateTime payingDate;
  DateTime expiryDate;
  double value;
  InvoiceStatus status;
  PDFDocument _doc = PDFDocument();

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

  PDFDocument get doc {
    return _doc;
  }

  Future<void> loadDocument() async {
    _doc = await PDFDocument.fromURL(
      'https://backend.intelbras.com/sites/default/files/2020-01/Datasheet-XFF1-XFF2-01.20.pdf',
    );
  }
}
