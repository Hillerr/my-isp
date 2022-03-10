import 'package:flutter/material.dart';
import 'package:my_isp/components/home_page/contact_card.dart';
import 'package:my_isp/components/home_page/equipment_card.dart';
import 'package:my_isp/components/home_page/options_card.dart';
import 'package:my_isp/components/home_page/plan_card.dart';
import 'package:my_isp/core/models/internet_plan_list.dart';
import 'package:my_isp/pages/finantial_page.dart';
import 'package:my_isp/utils/routes.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<InternetPlanList>(context, listen: false)
        .loadContractedPlan()
        .then(
          (value) => setState(() {
            _isLoading = false;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InternetPlanList>(context, listen: false);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (_isLoading)
                const PlanCard(
                  uploadSpeed: 0,
                  downloadSpeed: 0,
                )
              else
                PlanCard(
                  uploadSpeed: provider.contractedUpload,
                  downloadSpeed: provider.contractedDownload,
                ),
              const SizedBox(
                height: 10,
              ),
              if (_isLoading)
                const EquipmentCard(
                  equipmentName: "Caarregando",
                  equipementImageUrl:
                      'https://backend.intelbras.com/sites/default/files/styles/medium/public/2021-02/Perspectiva_esq_1_0.png',
                )
              else
                EquipmentCard(
                  equipmentName: provider.myInternetPlan!.equipment,
                  equipementImageUrl:
                      'https://backend.intelbras.com/sites/default/files/styles/medium/public/2021-02/Perspectiva_esq_1_0.png',
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
                    label: "Cancelar Plano",
                    icon: Icons.delete_forever,
                    route: AppRoutes.DELETE_ACCOUNT,
                    color: Colors.grey.shade200,
                  ),
                  OptionsCard(
                    label: "Outros serviços",
                    icon: Icons.miscellaneous_services,
                    route: AppRoutes.SERVICES,
                    color: Colors.grey.shade200,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
