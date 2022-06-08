import 'package:my_isp/invoice/models/invoice.dart';
import 'package:my_isp/invoice/models/repositories/invoice_repository.dart';
import 'package:my_isp/invoice/models/repositories/invoice_repository_firebase.dart';
import 'package:my_isp/invoice/models/repositories/invoice_repository_mock.dart';

class InvoiceController {
  List<Invoice> _invoiceList = [];

  Future<List<Invoice>> load() async {
    _invoiceList = await InvoiceRepository().load();
    return _invoiceList;
  }

  InvoiceController();

  List<Invoice> get items {
    return [..._invoiceList];
  }

  int get itemsCount {
    return _invoiceList.length;
  }
}
