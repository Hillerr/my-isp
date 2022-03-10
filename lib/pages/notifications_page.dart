import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/components/notifications/notification_card.dart';
import 'package:my_isp/core/models/notification_list.dart';
import 'package:provider/provider.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<NotificationList>(
      context,
      listen: false,
    ).loadNotifications().then(
          (value) => setState(() {
            _isLoading = false;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotificationList>(context, listen: false);
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
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator(),
              )
            else if (provider.itemsCount == 0)
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
