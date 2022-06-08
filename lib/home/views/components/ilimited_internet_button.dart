import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IlimitedInternetButton extends StatelessWidget {
  final Function() onClick;
  final String label;
  final Icon icon;
  const IlimitedInternetButton({
    Key? key,
    required this.onClick,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onClick,
      icon: icon,
      label: Text(
        label,
        textAlign: TextAlign.center,
        style: GoogleFonts.quicksand(
          color: Colors.black87,
        ),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(160, 60),
        elevation: 0,
        primary: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
    );
  }
}
