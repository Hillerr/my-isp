import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/core/models/internet_plan.dart';

class InternetPlanCard extends StatelessWidget {
  final InternetPlan internetPlan;
  const InternetPlanCard({
    Key? key,
    required this.internetPlan,
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
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "${internetPlan.name}: ",
                  style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87),
                ),
                Column(
                  children: [
                    const Text("Download"),
                    Text(
                      "${internetPlan.downloadSpeed} Mb",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.red),
                    )
                  ],
                ),
                Column(
                  children: [
                    const Text("Upload"),
                    Text(
                      "${internetPlan.uploadSpeed} Mb",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 47, 110, 49)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text("Preço"),
                    Text(
                      "R\$ ${internetPlan.price}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.black38,
              thickness: 1,
            ),
            ElevatedButton.icon(
              onPressed: () => true,
              icon: const Icon(
                Icons.call,
                color: Colors.lightBlue,
                size: 30,
              ),
              label: Text("Contratar ${internetPlan.name}",
                  style: GoogleFonts.quicksand(color: Colors.lightBlue)),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    color: Colors.lightBlue,
                    width: 1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
