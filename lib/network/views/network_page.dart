import 'package:flutter/material.dart';
import 'package:my_isp/home/views/components/options_card.dart';
import 'package:my_isp/utils/routes.dart';

class NetworkPage extends StatelessWidget {
  const NetworkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OptionsCard(
                  label: "Alterar SSID e Senha",
                  icon: Icons.password,
                  route: AppRoutes.SSID_CONFIG,
                  color: Colors.grey.shade200,
                ),
                OptionsCard(
                  label: "Controle Parental",
                  icon: Icons.child_friendly,
                  route: AppRoutes.PARENTAL_CONTROL,
                  color: Colors.grey.shade200,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OptionsCard(
                  label: "Rede de Visitante",
                  icon: Icons.person,
                  route: AppRoutes.VISITOR_PWD_PAGE,
                  color: Colors.grey.shade200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
