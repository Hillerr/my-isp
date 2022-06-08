import 'dart:async';
import 'dart:math';

import 'package:my_isp/invoice/models/invoice.dart';
import 'package:my_isp/invoice/models/repositories/invoice_repository.dart';

class InvoiceRepositoryMock implements InvoiceRepository {
  static final List<Invoice> _invoiceList = [
    Invoice(
      id: Random().nextDouble().toString(),
      payingDate: DateTime.now(),
      expiryDate: DateTime.now(),
      value: 250,
      code: "423423423",
    ),
    Invoice(
      id: Random().nextDouble().toString(),
      payingDate: DateTime.now(),
      expiryDate: DateTime.now(),
      value: 250,
      code: "423423423",
    ),
    Invoice(
      id: Random().nextDouble().toString(),
      payingDate: DateTime.now(),
      expiryDate: DateTime.now(),
      value: 250,
      code: "423423423",
    ),
    Invoice(
      id: Random().nextDouble().toString(),
      payingDate: DateTime.now(),
      expiryDate: DateTime.now(),
      value: 250,
      code: "423423423",
    ),
  ];

  static MultiStreamController<List<Invoice>>? _controller;
  static final Stream<List<Invoice>> _invoicesPlanStream =
      Stream<List<Invoice>>.multi((controller) {
    _controller = controller;
    _controller?.add(_invoiceList);
  });

  @override
  Future<List<Invoice>> load() async {
    final invoices = await _invoicesPlanStream.first;
    return invoices;
  }

  @override
  Future<String?> loadPDFUri(String invoiceId) async {
    await Future.delayed(const Duration(seconds: 1));
    return "";
  }
}
