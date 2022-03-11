import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key}) : super(key: key);

  void _callNumber() async {
    bool? res = await FlutterPhoneDirectCaller.callNumber('48123456');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(
          color: Colors.black,
          width: 1,
        ),
      ),
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  const Icon(Icons.phone_forwarded),
                  Text(
                    "  Antedimento:",
                    style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.black38,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () => true,
                  icon: const Icon(
                    Icons.mail,
                    color: Colors.lightBlue,
                    size: 30,
                  ),
                  label: Text("E-mail",
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
                  onPressed: () => _callNumber(),
                  icon: const Icon(
                    Icons.call,
                    color: Colors.lightBlue,
                    size: 30,
                  ),
                  label: Text("Telefone",
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
