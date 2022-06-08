import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/home/models/repositories/notification/notification_repository.dart';
import 'package:my_isp/home/models/repositories/notification/notification_repository_firebase.dart';
import 'package:my_isp/home/views/components/notification_card.dart';
import 'package:provider/provider.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationRepositoryFirebase>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Notificações",
          style: GoogleFonts.quicksand(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w400,
              fontSize: 25),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (provider.itemsCount == 0)
              const Center(
                child: Text("Você não possuí nenhuma notificação."),
              )
            else
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return NotificationCard(
                        notification: provider.items[index]);
                  },
                  itemCount: provider.itemsCount,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
