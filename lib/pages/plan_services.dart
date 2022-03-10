import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_isp/components/home_page/plan_card.dart';
import 'package:my_isp/components/internet_plans/internet_plan_card.dart';
import 'package:my_isp/core/models/internet_plan_list.dart';
import 'package:provider/provider.dart';

class PlanServicesPage extends StatefulWidget {
  const PlanServicesPage({Key? key}) : super(key: key);

  @override
  State<PlanServicesPage> createState() => _PlanServicesPageState();
}

class _PlanServicesPageState extends State<PlanServicesPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Provider.of<InternetPlanList>(
      context,
      listen: false,
    ).loadPlans().then(
          (value) => setState(() {
            _isLoading = false;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<InternetPlanList>(context, listen: false);

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
                    return InternetPlanCard(
                        internetPlan: provider.items[index]);
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
