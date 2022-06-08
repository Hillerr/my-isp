import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/network/controllers/parental_control_controller.dart';
import 'package:my_isp/network/models/parental_control.dart';
import 'package:provider/provider.dart';

class ParentalControlPage extends StatefulWidget {
  const ParentalControlPage({Key? key}) : super(key: key);

  @override
  State<ParentalControlPage> createState() => _ParentalControlPageState();
}

class _ParentalControlPageState extends State<ParentalControlPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParentalControl>(context, listen: false);
    final controller = ParentalControlController(provider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Controle Parental",
          style: GoogleFonts.quicksand(
            color: Colors.grey.shade900,
            fontWeight: FontWeight.w400,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                controller.openForm(context);
              });
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
            ),
            width: double.infinity,
            child: Text(
              "Dispositivos controlados:",
              style: GoogleFonts.quicksand(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Colors.black87),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.devices[index].name),
                  subtitle:
                      Text("MAC: ${controller.devices[index].macAddress}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => controller.editDevice(
                          controller.devices[index],
                        ),
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => setState(() {
                          controller.removeDevice(controller.devices[index]);
                        }),
                      ),
                    ],
                  ),
                );
              },
              itemCount: controller.itemsCount,
              separatorBuilder: (ctx, index) => const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
