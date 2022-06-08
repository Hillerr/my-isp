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
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(route),
        child: Card(
          margin: const EdgeInsets.only(right: 8, left: 8, top: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Colors.grey.shade700,
                  size: 50,
                ),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(color: Colors.grey),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
