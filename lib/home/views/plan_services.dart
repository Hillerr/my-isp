import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/home/controllers/internet_plans_controller.dart';
import 'package:my_isp/home/models/internet_plan.dart';
import 'package:my_isp/home/views/components/internet_plan_card.dart';

class PlanServicesPage extends StatefulWidget {
  const PlanServicesPage({Key? key}) : super(key: key);

  @override
  State<PlanServicesPage> createState() => _PlanServicesPageState();
}

class _PlanServicesPageState extends State<PlanServicesPage> {
  @override
  Widget build(BuildContext context) {
    final controller = InternetPlanController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 1,
        centerTitle: true,
        title: Text(
          "Planos de internet",
          style: GoogleFonts.quicksand(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w400,
              fontSize: 25),
        ),
      ),
      body: FutureBuilder<List<InternetPlan>>(
          future: controller.load(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (controller.itemsCount == 0)
                      const Center(
                        child: Text("Não há planos"),
                      )
                    else
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return InternetPlanCard(
                                internetPlan: controller.items[index]);
                          },
                          itemCount: controller.itemsCount,
                        ),
                      ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
