import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/home/controllers/ilimited_internet_controller.dart';
import 'package:my_isp/home/models/ilimited_internet.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class IlimitedInternetPage extends StatelessWidget {
  const IlimitedInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<IlimitedInternetController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Solicitação de Internet Ilimitada",
          style: GoogleFonts.quicksand(
            color: Colors.grey.shade900,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await controller.openForm(context);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
          future: controller.load(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 55, 145, 59)),
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                controller.itemsCount == 0) {
              return const Center(
                child: Text(
                    "Você não possui nenhuma solicitação de internet ilimitada"),
              );
            } else {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    width: double.infinity,
                    child: Text(
                      "Minhas Solicitações de Internet Ilimitada:",
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
                          title: Text(
                            "Data e hora: ${controller.dateTime(controller.ilimitedInternet[index])}",
                          ),
                          subtitle: Text(
                              "Duração: ${controller.ilimitedInternet[index].duration.inHours} horas"),
                          leading: Text(
                            controller.getStatus(
                              controller.ilimitedInternet[index],
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (controller.ilimitedInternet[index].status ==
                                  IlimitedInternetStatus.WAITING)
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () async =>
                                      await controller.remove(
                                          controller.ilimitedInternet[index]),
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
              );
            }
          }),
    );
  }
}
