import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/core/models/notification.dart';

class NotificationCard extends StatelessWidget {
  final NotificationMsg notification;
  const NotificationCard({Key? key, required this.notification})
      : super(key: key);

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
                  const Icon(Icons.notifications),
                  Text(
                    "  Notificação ${notification.receivedAt.month}/${notification.receivedAt.year}:",
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
                Text(notification.newMsg ? "Nova mesagem" : ""),
              ],
            ),
            Text(
              notification.msg,
              textAlign: TextAlign.start,
              style: GoogleFonts.quicksand(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
