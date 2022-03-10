import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/core/models/invoice.dart';
import 'package:intl/intl.dart';
import 'package:my_isp/utils/routes.dart';

class InvoiceCard extends StatelessWidget {
  final Invoice invoice;
  const InvoiceCard({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Colors.grey,
          width: 1,
        ),
      ),
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(Icons.payment),
                  Text(
                    "  Fatura ${invoice.payingDate.month}/${invoice.payingDate.year}:",
                    style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "Data de vencimento: ${DateFormat("dd/MM/yyyy").format(invoice.expiryDate)}"),
                Text("Valor: R\$ ${invoice.value.toInt()}")
              ],
            ),
            Text(
              "Status: ${invoice.toString()}",
              textAlign: TextAlign.start,
              style: GoogleFonts.quicksand(fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pushNamed(
                    AppRoutes.PDF_VIEW,
                    arguments: invoice,
                  ),
                  icon: const Icon(
                    Icons.file_download,
                    color: Colors.lightBlue,
                    size: 30,
                  ),
                  label: Text("Baixar PDF",
                      style: GoogleFonts.quicksand(color: Colors.lightBlue)),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: Colors.lightBlue,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => true,
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.lightBlue,
                    size: 30,
                  ),
                  label: Text("Código de barras",
                      style: GoogleFonts.quicksand(color: Colors.lightBlue)),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: Colors.lightBlue,
                        width: 1,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
