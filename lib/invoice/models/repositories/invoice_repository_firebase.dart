import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:my_isp/auth/models/repositories/auth_repository.dart';
import 'package:my_isp/auth/models/user_auth.dart';
import 'package:my_isp/invoice/models/invoice.dart';
import 'package:my_isp/invoice/models/repositories/invoice_repository.dart';

class InvoiceRepositoryFirebase implements InvoiceRepository {
  List<Invoice> _invoices = [];
  AuthUser? _currentuser = AuthRepository().currentUser;

  int get itemsCount => _invoices.length;

  @override
  Future<List<Invoice>> load() async {
    final collection = await FirebaseFirestore.instance
        .collection("invoices")
        .doc(_currentuser!.id)
        .collection("invoices")
        .get();

    collection.docs.forEach(
      ((element) async {
        final data = element.data();
        final invoice = Invoice(
          id: data['id'],
          payingDate: DateFormat("dd/MM/yyyy").parse(data['payingDate']),
          expiryDate: DateFormat("dd/MM/yyyy").parse(data['expiryDate']),
          value: double.tryParse(data['value'].toString())!,
          code: data['code'],
        );
        _invoices.add(invoice);
      }),
    );

    return [..._invoices];
  }

  @override
  Future<String?> loadPDFUri(String invoiceId) async {
    final storage = FirebaseStorage.instance;
    final imageRef = storage
        .ref()
        .child('invoices')
        .child(_currentuser!.id)
        .child('$invoiceId.pdf');

    return await imageRef.getDownloadURL();
  }
}
