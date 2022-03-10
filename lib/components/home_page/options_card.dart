import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OptionsCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final String route;

  const OptionsCard({
    Key? key,
    required this.label,
    required this.icon,
    required this.route,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.only(right: 5, left: 5, top: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: color,
        child: Column(
          children: [
            IconButton(
              color: Colors.grey.shade700,
              onPressed: () {
                Navigator.of(context).pushNamed(route);
              },
              icon: Icon(
                icon,
              ),
              iconSize: 50,
            ),
            Text(
              label,
              style: GoogleFonts.quicksand(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
