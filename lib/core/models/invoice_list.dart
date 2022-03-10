import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:my_isp/core/models/invoice.dart';
import 'package:my_isp/utils/urls.dart';

class InvoiceList with ChangeNotifier {
  List<Invoice> _invoiceList = [];
  final String _token;
  final String _uid;

  InvoiceList(this._token, this._uid, this._invoiceList);

  List<Invoice> get items {
    return [..._invoiceList];
  }

  int get itemsCount {
    return _invoiceList.length;
  }

  Future<void> loadInvoices() async {
    List<Invoice> invoices = [];
    final response = await http.get(
      Uri.parse('${Urls.invoice}/$_uid.json?auth=$_token'),
    );

    if (response.body == 'null') return;

    List<dynamic> data = jsonDecode(response.body);

    for (var invoiceData in data) {
      if (invoiceData != null) {
        invoices.add(
          Invoice(
            id: '1',
            payingDate:
                DateFormat("dd/MM/yyyy").parse(invoiceData['payingDate']),
            expiryDate:
                DateFormat("dd/MM/yyyy").parse(invoiceData['expiryDate']),
            value: invoiceData['value'].toDouble(),
          ),
        );
      }
    }

    _invoiceList = invoices.reversed.toList();
    notifyListeners();
  }
}
