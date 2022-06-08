import 'package:my_isp/invoice/models/invoice.dart';
import 'package:my_isp/invoice/models/repositories/invoice_repository_firebase.dart';
import 'package:my_isp/invoice/models/repositories/invoice_repository_mock.dart';

abstract class InvoiceRepository {
  static List<Invoice> invoices = [];
  Future<List<Invoice>> load();
  Future<String?> loadPDFUri(String invoiceId);

  factory InvoiceRepository() {
    return InvoiceRepositoryFirebase();
  }
}
