import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:my_isp/auth/models/repositories/auth_repository.dart';
import 'package:my_isp/home/models/contracted_internet_plan.dart';
import 'package:my_isp/home/models/internet_plan.dart';
import 'package:my_isp/home/models/repositories/contracted_internet_plan/my_internet_plan_repository.dart';
import 'package:my_isp/home/models/repositories/internet_plan/internet_plan_repository.dart';

class MyInternetPlanRepositoryFirebase implements MyInternetPlanRepository {
  final user = AuthRepository().currentUser;
  final internetPlansRepository = InternetPlanRepository();
  MyInternetPlan? _myInternetPlan;

  Future<MyInternetPlan?> _getDocument() async {
    final ref = FirebaseFirestore.instance.collection('my-internet-plan');
    final doc = await ref.doc('WHBvgK7rpuOYiOCZg8LWBr4RLKH3').get();

    final data = doc.data()!;
    final internetPlan = await _getInternetPlan(data['internetPlan']);

    final myInternetPlan = MyInternetPlan(
      internetPlan: internetPlan,
      contractedAt: DateFormat("dd/MM/yyyy").parse(data["contractedAt"]),
      equipment: data['equipment'],
      equipmentImage: data['equipmentImage'],
    );

    return myInternetPlan;
  }

  Future<InternetPlan> _getInternetPlan(String internetPlanName) async {
    final collection = FirebaseFirestore.instance.collection("internet-plans");

    final doc = await collection.doc(internetPlanName).get();

    final data = doc.data()!;

    return InternetPlan(
      name: data['name'],
      uploadSpeed: data['uploadSpeed'],
      downloadSpeed: data['downloadSpeed'],
      price: data['price'],
    );
  }

  @override
  Future<MyInternetPlan> load() async {
    final myInternetPlan = await _getDocument();
    return myInternetPlan!;
  }
}
