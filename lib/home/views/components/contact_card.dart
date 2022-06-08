import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:my_isp/utils/color_scheme.dart';
import 'package:url_launcher/url_launcher.dart';

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
            width: 1, color: AppColorScheme.buttonContentColor1),
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
                  onPressed: () {
                    String url = "https://wa.me/48123456789/?text=Olá";
                    launch(url);
                  },
                  icon: const Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                    size: 25,
                  ),
                  label: Text("WhatsApp",
                      style: GoogleFonts.quicksand(
                          color: AppColorScheme.bottonColor)),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: AppColorScheme.bottonColor,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () => _callNumber(),
                  icon: const Icon(
                    Icons.call,
                    color: AppColorScheme.bottonColor,
                    size: 30,
                  ),
                  label: Text("Telefone",
                      style: GoogleFonts.quicksand(
                          color: AppColorScheme.bottonColor)),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(
                        color: AppColorScheme.bottonColor,
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
