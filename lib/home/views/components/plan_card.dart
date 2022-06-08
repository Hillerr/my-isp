import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanCard extends StatelessWidget {
  final int uploadSpeed;
  final int downloadSpeed;
  const PlanCard({
    Key? key,
    required this.uploadSpeed,
    required this.downloadSpeed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(width: 1, color: Colors.black54),
      ),
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                "Meu plano de internet:",
                style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87),
              ),
            ),
            const Divider(
              color: Colors.black38,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text("Download"),
                    Text(
                      "$downloadSpeed Mb",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Colors.red),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Text("Upload"),
                    Text(
                      "$uploadSpeed Mb",
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 47, 110, 49)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
