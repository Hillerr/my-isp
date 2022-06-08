import 'package:flutter/material.dart';
import 'package:my_isp/home/controllers/my_internet_plan_controller.dart';
import 'package:my_isp/home/models/contracted_internet_plan.dart';
import 'package:my_isp/home/views/components/contact_card.dart';
import 'package:my_isp/home/views/components/equipment_card.dart';
import 'package:my_isp/home/views/components/options_card.dart';
import 'package:my_isp/home/views/components/plan_card.dart';
import 'package:my_isp/utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final controller = MyInternetPlanController();
    return FutureBuilder<MyInternetPlan>(
        future: controller.load(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final myInternetPlan = controller.myInternetPlan;
            return Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      PlanCard(
                        uploadSpeed: myInternetPlan!.contractedUpload,
                        downloadSpeed: myInternetPlan.contractedDownload,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      EquipmentCard(
                        equipmentName: myInternetPlan.equipment,
                        equipementImageUrl: myInternetPlan.equipmentImage,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ContactCard(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OptionsCard(
                            label: "Notificações",
                            icon: Icons.notifications,
                            route: AppRoutes.NOTIFICATIONS,
                            color: Colors.grey.shade200,
                          ),
                          OptionsCard(
                            label: "Upgrade de Plano",
                            icon: Icons.upgrade,
                            route: AppRoutes.PLAN_UPGRADE,
                            color: Colors.grey.shade200,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OptionsCard(
                            label: "Teste de plano de internet",
                            icon: Icons.preview,
                            route: AppRoutes.PLAN_TEST,
                            color: Colors.grey.shade200,
                          ),
                          OptionsCard(
                            label: "Contratar velocidade ilimitada",
                            icon: Icons.speed,
                            route: AppRoutes.ILIMITED_INTERNET,
                            color: Colors.grey.shade200,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OptionsCard(
                            label: "IPTV",
                            icon: Icons.tv,
                            route: AppRoutes.IPTV,
                            color: Colors.grey.shade200,
                          ),
                          OptionsCard(
                            label: "Dispositivos IoT",
                            icon: Icons.device_hub,
                            route: AppRoutes.IOT_DEVICES,
                            color: Colors.grey.shade200,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        });
  }
}
