import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_isp/home/models/internet_plan.dart';
import 'package:my_isp/home/models/repositories/internet_plan/internet_plan_repository.dart';
import 'package:my_isp/home/models/repositories/internet_plan/internet_plan_repository_mock.dart';

class InternetPlanRepositoryFirebase implements InternetPlanRepository {
  List<InternetPlan> _internetPlans = [];

  int get itemsCount => _internetPlans.length;

  @override
  Future<List<InternetPlan>> load() async {
    final collection =
        await FirebaseFirestore.instance.collection("internet-plans").get();

    collection.docs.forEach(
      ((element) {
        _internetPlans.add(
          InternetPlan(
            name: element['name'],
            uploadSpeed: element['uploadSpeed'],
            downloadSpeed: element['downloadSpeed'],
            price: element['price'],
          ),
        );
      }),
    );

    return _internetPlans;
  }
}
