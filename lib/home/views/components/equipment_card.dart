import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EquipmentCard extends StatelessWidget {
  final String equipmentName;
  final String equipementImageUrl;
  const EquipmentCard({
    Key? key,
    required this.equipmentName,
    required this.equipementImageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                "Equipamento:",
                style: GoogleFonts.quicksand(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
              ),
            ),
            const Divider(
              color: Colors.black38,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150,
                  child: Text(
                    equipmentName,
                    style: GoogleFonts.quicksand(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 125,
                  width: 125,
                  child: Image.network(
                    equipementImageUrl,
                    fit: BoxFit.fill,
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
