import 'package:my_isp/home/models/internet_plan.dart';

class MyInternetPlan {
  InternetPlan internetPlan;
  DateTime contractedAt;
  String equipment;
  String equipmentImage;

  MyInternetPlan({
    required this.internetPlan,
    required this.contractedAt,
    required this.equipment,
    required this.equipmentImage,
  });

  int get contractedUpload {
    return internetPlan.uploadSpeed;
  }

  int get contractedDownload {
    return internetPlan.downloadSpeed;
  }
}
