import 'package:flutter/material.dart';

class IlimitedInternetFormData {
  TimeOfDay? initialTimeOfDay;
  DateTime? initialDateTime;
  TimeOfDay? finalTimeOfDay;
  DateTime? finalDateTime;

  bool isComplete() {
    if (initialTimeOfDay != null &&
        initialDateTime != null &&
        finalTimeOfDay != null &&
        finalDateTime != null) {
      return true;
    } else {
      return false;
    }
  }
}
